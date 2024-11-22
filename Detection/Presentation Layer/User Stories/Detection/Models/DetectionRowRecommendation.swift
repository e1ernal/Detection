//
//  DetectionRowResunt.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

struct DetectionRowRecommendation: DetectionRowProtocol {
    var type: DetectionRowType
    let title: String
    
    init(title: String) {
        self.type = .recommendations
        self.title = title
    }
}
