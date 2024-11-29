//
//  DetectionRowImage.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

import UIKit

struct DetectionRowImage: DetectionRowProtocol {
    var type: DetectionRowType
    let image: UIImage
    
    init(image: UIImage) {
        self.type = .image
        self.image = image
    }
}
