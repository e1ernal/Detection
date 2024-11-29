//
//  Detection.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

import UIKit
import Vision

final class Detection {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    // MARK: - Initialization
    
    // MARK: - Public Methods
    public static func configureData(image: UIImage,
                                     detections: [VNRecognizedObjectObservation]) -> DetectionData {
        let detectionsDictionary = Dictionary(grouping: detections, by: \.labels[0].identifier)
        
        // Section 1: Image
        let row11 = DetectionRowImage(image: image)
        let section1 = DetectionSection(rows: [row11])
        
        // Section 2: Recommendations
        let detectionsLabels = detectionsDictionary.keys
        var rows2: [DetectionRowRecommendation] = []
        for detectionLabel in detectionsLabels {
            let recommendation = SignData.getSign(by: detectionLabel)?.recommendation
            rows2.append(DetectionRowRecommendation(title: recommendation ?? ""))
        }
        
        let recommendation1 = "These recommendations will help you follow the rules of the road and ensure safety on the road"
        let recommendation2 = "Try to take a new photo so that the road signs are clearly visible"
        let recommendation = rows2.isEmpty ? recommendation2 : recommendation1
        
        let section2 = DetectionSection(header: "Recommendations",
                                        rows: rows2,
                                        footer: recommendation)
        
        // Section 3: Call
        let row21 = DetectionRowCall(title: "Information Service", subtitle: "+7 (922) 123-45-67")
        let section3 = DetectionSection(header: "Contact", rows: [row21])
        
        // Section 4: Recognized signs
        var rows4: [DetectionRowSign] = []
        for (key, value) in detectionsDictionary {
            let sign = SignData.signs.first(where: { $0.label == key })
            rows4.append(DetectionRowSign(title: sign?.title ?? "",
                                          subtitle: sign?.subtitle ?? "",
                                          image: UIImage(named: sign?.image ?? "") ?? UIImage(),
                                          count: value.count))
        }
        
        rows4.sort { $0.count > $1.count }
        let section4 = DetectionSection(header: "Recognized Signs",
                                        rows: rows4,
                                        footer: "\(detections.count) signs (\(rows4.count) unique)")
        
        // Section 5: Tips
        var rows5: [DetectionRowRecommendation] = []
        for detectionLabel in detectionsLabels {
            let recommendation = SignData.getSign(by: detectionLabel)?.tip
            rows5.append(DetectionRowRecommendation(title: recommendation ?? ""))
        }
        
        let tip1 = "Based on real user experience"
        let tip2 = "Try to get closer to the road sign or take a picture of it from a different angle"
        let tip = rows2.isEmpty ? tip2  : tip1
        
        let section5 = DetectionSection(header: "Tips",
                                        rows: rows5,
                                        footer: tip)
        
        // All Sections
        let detectionData = DetectionData(sections: [section1, section3, section2, section5, section4])
        
        return detectionData
        
    }
    
    // MARK: - Private Methods
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: Detection.self))") }
}
