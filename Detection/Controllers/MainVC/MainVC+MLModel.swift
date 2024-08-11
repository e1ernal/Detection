//
//  MainVC+MLModel.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import CoreML
import UIKit
import Vision

extension MainVC {
    /// Object Detection
    /// - Parameters:
    ///   - request: type VNRequest
    ///   - error: type Error
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
            self.drawDetectionsOnPreview(detections: detections)
        }
    }

    /// Drawing rectangles to highlight found objects
    /// - Parameter detections: Array of VNRecognizedObjectObservation
    func drawDetectionsOnPreview(detections: [VNRecognizedObjectObservation]) {
        for detection in detections {
            signImage = Draw.rectangles(image: signImage,
                                        boundingBoxes: [detection.boundingBox],
                                        texts: [detection.labels[0].identifier.mlModelLabel()])
        }

        signsCount = detections.count
        signs = detections
        hideActivityIndicator()
        signTableView.reloadData()
    }

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
}
