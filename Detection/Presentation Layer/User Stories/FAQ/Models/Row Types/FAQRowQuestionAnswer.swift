//
//  FAQRowQuestionAnswer.swift
//  Detection
//
//  Created by e1ernal on 29.11.2024.
//

struct FAQRowQuestionAnswer: FAQRowProtocol {
    var type: FAQRowType
    var question: String
    var answer: String
    
    init(question: String, answer: String) {
        self.type = .questionAnswer
        self.question = question
        self.answer = answer
    }
}
