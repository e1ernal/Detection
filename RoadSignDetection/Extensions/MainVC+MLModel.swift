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
        guard let image = signImage else { return }
        
        let imageSize = image.size
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)
        
        image.draw(at: CGPoint.zero)
        
        for detection in detections {
            let boundingBox = detection.boundingBox
            let x = boundingBox.minX * image.size.width
            let y = (1 - boundingBox.minY - boundingBox.height) * image.size.height
            let width = boundingBox.width * image.size.width
            let height = boundingBox.height * image.size.height
            
            let rectangle = CGRect(x: x,
                                   y: y,
                                   width: width,
                                   height: height)
            UIColor(red: 0, green: 1, blue: 0, alpha: 0.4).setFill()
            UIRectFillUsingBlendMode(rectangle, CGBlendMode.normal)
            
            let textRectangle = CGRect(x: x - 100,
                                       y: y - 50,
                                       width: width + 200,
                                       height: 100)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            paragraphStyle.firstLineHeadIndent = 5.0
            
            let strokeTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.backgroundColor: UIColor.white,
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .heavy)]
            as [NSAttributedString.Key : Any]
            
            let textSign = detection.labels.first?.identifier.mlModelLabel() ?? ""
            textSign.draw(in: textRectangle, withAttributes: strokeTextAttributes)
        }
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        signImage = newImage
        signsCount = detections.count
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
