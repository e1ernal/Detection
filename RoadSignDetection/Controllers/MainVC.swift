//
//  ViewController.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import UIKit
import CoreML
import Vision

class MainVC: UIViewController {
    
    lazy var signTableView = UITableView(frame: .zero, style: .insetGrouped)
    var activityView: UIActivityIndicatorView?
    var isImage: Bool = false
    var signImage: UIImage = UIImage()
    var originalImage: UIImage = UIImage()
    var signsCount: Int = 0
    var signs: [VNRecognizedObjectObservation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(title: "Traffic Sign Recognition",
                           backgroundColor: .systemBackground)
        setupActions()
        setupTableView()
    }
    
    //MARK: Detection request
    lazy var detectionRequest: VNCoreMLRequest = {
        do {
            //MARK: ML Model Configuration
            let config = MLModelConfiguration()
            let model = try VNCoreMLModel(for: ObjectDetector(configuration: config).model)
            
            //MARK: Process Detection Request
            let request = VNCoreMLRequest(model: model,
                                          completionHandler: { [weak self] request, error in
                self?.processDetections(for: request, error: error)
            })
            request.imageCropAndScaleOption = .scaleFit
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
}
