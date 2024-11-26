//
//  DetectionRowCall.swift
//  Detection
//
//  Created by e1ernal on 26.11.2024.
//

import UIKit

struct DetectionRowCall: DetectionRowProtocol {
    var type: DetectionRowType
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String) {
        self.type = .call
        self.title = title
        self.subtitle = subtitle
    }
}
