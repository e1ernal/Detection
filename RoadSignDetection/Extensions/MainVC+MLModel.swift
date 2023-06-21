//
//  MainVC+MLModel.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import UIKit
import CoreML
import Vision

extension MainVC {
    
    //MARK: Object Detection
    func processDetections(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                print("Unable to detect anything.\n\(error!.localizedDescription)")
                return
            }
            
            let detections = results as! [VNRecognizedObjectObservation]
            self.drawDetectionsOnPreview(detections: detections)
        }
    }
    
    //MARK: Drawing rectangles to highlight found objects
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
        //MARK: Preparing the desired aspect ratio
        let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue))
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to create \(CIImage.self) from \(image).")
        }
        
        //MARK: Performing detection
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation!)
            do {
                try handler.perform([self.detectionRequest])
            } catch {
                print("Failed to perform detection.\n\(error.localizedDescription)")
            }
        }
    }
}
