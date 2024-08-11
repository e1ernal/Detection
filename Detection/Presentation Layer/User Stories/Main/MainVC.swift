//
//  ViewController.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import CoreML
import UIKit
import Vision

class MainVC: UIViewController {
    lazy var signTableView = UITableView(frame: .zero, style: .insetGrouped)
    var activityView = UIActivityIndicatorView()
    var isImage = false
    var signImage = UIImage()
    var originalImage = UIImage()
    var signsCount: Int = 0
    var signs: [VNRecognizedObjectObservation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configure(title: "Detection")
        setupActions()
        setupTableView()
    }

    /// Detection request
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

    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }

    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
}
