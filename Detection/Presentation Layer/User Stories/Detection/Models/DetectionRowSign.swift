//
//  DetectionRowSign.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

import UIKit

struct DetectionRowSign: DetectionRowProtocol {
    var type: DetectionRowType
    let title: String
    let subtitle: String
    let image: UIImage
    let count: Int
    
    init(title: String, subtitle: String, image: UIImage, count: Int) {
        self.type = .sign
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.count = count
    }
}
