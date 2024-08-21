//
//  InfoData.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import Foundation

struct InfoData {
    let rows: [(String, String)]
    
    init() {
        self.rows = [
            ("1", "Select an image that contains road signs"),
            ("2", "The application will process the image and highlight all recognized road signs"),
            ("3", "You can view detailed information on each recognized road sign")
        ]
    }
}
