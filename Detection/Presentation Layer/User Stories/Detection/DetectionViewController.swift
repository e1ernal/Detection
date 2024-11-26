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
    var detectionData: DetectionData {
        didSet {
            detectionView.refresh(empty: detectionData.sections.isEmpty)
        }
    }
    
    private lazy var settingsButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "ellipsis")
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .medium
        configuration.baseForegroundColor = .label
        configuration.baseBackgroundColor = .secondarySystemGroupedBackground
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var detectionButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "plus")
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .medium
        configuration.baseForegroundColor = .label
        configuration.baseBackgroundColor = .secondarySystemGroupedBackground
        
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(detectionTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        detectionView = DetectionView()
        detectionData = DetectionData()
        
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
        view.backgroundColor = .systemBackground
        detectionView.configure(delegate: self, dataSource: self)
        detectionData = DetectionData()
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
        let button1 = UIBarButtonItem(customView: settingsButton)
        let button2 = UIBarButtonItem(customView: detectionButton)
        
        self.navigationItem.rightBarButtonItems = [button1]
        self.navigationItem.leftBarButtonItem = button2
    }
    
    // MARK: - Protocols
    // PHPickerViewControllerDelegate
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: .none)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else { return }
                DispatchQueue.main.async {
                    self.image = image
                    self.navigationItem.configureTitleView(title: "Detection",
                                                           subtitle: "recognizing",
                                                           animating: true)
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
            let sign = SignData.getSign(by: detection.labels[0].identifier)
            image = Draw.rectangles(image: image,
                                    boundingBoxes: [detection.boundingBox],
                                    texts: [sign?.title ?? ""])
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigationItem.configureTitleView(title: self.titleText, subtitle: "found \(detections.count) signs")
            self.detectionData = Detection.configureData(image: self.image, detections: detections)
        }
        
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: DetectionViewController.self))") }
}

extension DetectionViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return detectionData.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section >= 0, section < detectionData.sections.count else { return 0 }
        return detectionData.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section >= 0, section < detectionData.sections.count else { return nil }
        return detectionData.sections[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard section >= 0, section < detectionData.sections.count else { return nil }
        return detectionData.sections[section].footer
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 0 else { return UITableView.automaticDimension }
        
        let row = detectionData.sections[indexPath.section].rows[indexPath.row]
        guard let row = row as? DetectionRowImage else { return UITableView.automaticDimension }
        
        let image = row.image
        let ratio = image.size.height / image.size.width
        #warning("40?")
        let width = tableView.rect(forSection: 0).width - 40
        let height = min(width * ratio, width)
        
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = detectionData.sections[indexPath.section].rows[indexPath.row]
        
        switch row.type {
        case .image:
            let cell = tableView.dequeue(DetectionImageCell.self, for: indexPath)
            guard let row = row as? DetectionRowImage else { return cell }
            cell.configure(image: row.image)
            return cell
        case .recommendations:
            let cell = tableView.dequeue(AboutCell.self, for: indexPath)
            guard let row = row as? DetectionRowRecommendation else { return cell }
            cell.configure(title: row.title)
            return cell
        case .sign:
            let cell = tableView.dequeue(DetectionSignCell.self, for: indexPath)
            guard let row = row as? DetectionRowSign else { return cell }
            cell.configure(title: row.title, subtitle: row.subtitle, image: row.image, count: row.count)
            return cell
        case .call:
            let cell = tableView.dequeue(DetectionCallCell.self, for: indexPath)
            guard let row = row as? DetectionRowCall else { return cell }
            cell.configure(title: row.title, subtitle: row.subtitle)
            return cell
        }
    }
}
