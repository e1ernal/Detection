//
//  FAQRowQuestion.swift
//  Detection
//
//  Created by e1ernal on 29.11.2024.
//

import Foundation

struct FAQRowQuestion: FAQRowProtocol {
    var type: FAQRowType
    var text: String
    
    init(text: String) {
        self.type = .question
        self.text = text
    }
}
