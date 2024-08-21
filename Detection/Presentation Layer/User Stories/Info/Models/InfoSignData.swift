//
//  Signs.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import Foundation

struct InfoSignData {
    let title: String
    let subtitle: String
    let image: String

    init(title: String, subtitle: String, image: String) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
