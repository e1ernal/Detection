//
//  DetectionViewController.swift
//  Detection
//
//  Created by e1ernal on 12.08.2024.
//

import Photos
import PhotosUI
import UIKit
import Vision

final class DetectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    let titleText: String = "Detection"
    let subtitleText: String = "of road signs"
    var image = UIImage()
    
    var detectionView: DetectionView
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        detectionView = DetectionView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.configureTitleView(title: titleText, subtitle: subtitleText)
        configureNavigationBar()
    }
    
    override func loadView() {
        self.view = detectionView
    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    // Configure NavigationBar
    @objc func settingsTapped() {
        let nextVC = SettingsViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func detectionTapped() {
        showPHPicker()
    }
    
    func configureNavigationBar() {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(settingsTapped))
        
        let detectionButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"),
                                              style: .plain,
                                              target: self,
                                              action: #selector(detectionTapped))
        
        self.navigationItem.rightBarButtonItems = [settingsButton]
        self.navigationItem.leftBarButtonItem = detectionButton
    }
    
    // MARK: - Protocols
    // PHPickerViewControllerDelegate
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: .none)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else { return }
                DispatchQueue.main.async {
                    self.detectionView.configure(image: image, nilAnimation: true)
                    self.image = image
                    self.navigationItem.configureTitleView(title: "Detection", subtitle: "recognising", animating: true)
                    self.updateDetections(for: image)
                }
                
            }
        }
    }
    
    func showPHPicker() {
        var phPickerConfig = PHPickerConfiguration(photoLibrary: .shared())
        phPickerConfig.selectionLimit = 1
        phPickerConfig.filter = PHPickerFilter.any(of: [.images, .livePhotos])
        let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
        phPickerVC.delegate = self
        present(phPickerVC, animated: true)
    }
    
    // Vision
    func updateDetections(for image: UIImage) {
        // Preparing the desired aspect ratio
        let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue))
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to create \(CIImage.self) from \(image).")
        }
        
        // Performing detection
        DispatchQueue.global(qos: .userInitiated).async {
            if let orientation {
                let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
                do {
                    try handler.perform([self.detectionRequest])
                } catch {
                    print("Failed to perform detection.\n\(error.localizedDescription)")
                }
            }
        }
    }
    
    lazy var detectionRequest: VNCoreMLRequest = {
        do {
            /// ML Model Configuration
            let config = MLModelConfiguration()
            let model = try VNCoreMLModel(for: ObjectDetector(configuration: config).model)
            
            /// Process Detection Request
            let request = VNCoreMLRequest(model: model) { [weak self] request, error in
                self?.processDetections(for: request, error: error)
            }
            request.imageCropAndScaleOption = .scaleFit
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    func processDetections(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                if let error {
                    print("Unable to detect anything.\n\(error.localizedDescription)")
                }
                return
            }
            
            guard let detections = results as? [VNRecognizedObjectObservation]
            else {
                fatalError("VNRecognizedObjectObservation failed while casting")
            }
            self.drawDetections(detections: detections)
        }
    }
    
    func drawDetections(detections: [VNRecognizedObjectObservation]) {
        for detection in detections {
            image = Draw.rectangles(image: image,
                                    boundingBoxes: [detection.boundingBox],
                                    texts: [detection.labels[0].identifier])
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.detectionView.configure(image: self.image)
            self.navigationItem.configureTitleView(title: self.titleText, subtitle: "found: \(detections.count)")
        }
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: DetectionViewController.self))") }
}
