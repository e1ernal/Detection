//
//  FAQData.swift
//  Detection
//
//  Created by e1ernal on 29.11.2024.
//

import Foundation

struct FAQData {
    let sections: [FAQSection]
    
    init(sections: [FAQSection]) {
        self.sections = sections
    }
}

extension FAQData {
    static func configure() -> FAQData {
        // Section 1: How to use the app?
        let row11 = FAQRowQuestion(text: "How to use the app?")
        let section1 = FAQSection(rows: [row11])
        
        // Section 2: Which road signs are recognized?
        let row21 = FAQRowQuestion(text: "Which road signs are recognized?")
        let section2 = FAQSection(rows: [row21])
        
        // Section 3: General
        let row31 = FAQRowQuestionAnswer(question: "What is the purpose of this app?",
                                         answer: "The app is designed to recognize and provide information about various road signs to help drivers understand and comply with traffic regulations")
        let row32 = FAQRowQuestionAnswer(question: "Who can benefit from using this app?",
                                         answer: "The app is useful for new drivers, experienced drivers looking to refresh their knowledge, language learners, and anyone interested in road safety")
        let row33 = FAQRowQuestionAnswer(question: "Is the app free?",
                                         answer: "The app is free to download with basic features. Additional features may be available through in-app purchases")
        let section3 = FAQSection(header: "General",
                                  rows: [row31, row32, row33])
        
        // Section 4: Features
        let row41 = FAQRowQuestionAnswer(question: "What features does the app offer?",
                                         answer: "The app offers real-time road sign recognition, detailed descriptions of signs, quizzes for learning, and a history of recognized signs")
        let row42 = FAQRowQuestionAnswer(question: "Can I use the app offline?",
                                         answer: "Some features may require an internet connection, but the app offers offline access to previously recognized signs and basic functionalities")
        let row43 = FAQRowQuestionAnswer(question: "How accurate is the road sign recognition?",
                                         answer: "The app uses advanced machine learning algorithms to achieve high accuracy, although performance may vary based on lighting and weather conditions")
        let section4 = FAQSection(header: "Features",
                                  rows: [row41, row42, row43])
        
        // Section 5: Usage
        let row51 = FAQRowQuestionAnswer(question: "How do I use the road sign recognition feature?",
                                         answer: "Simply point your device's camera at the road sign, and the app will automatically recognize it and display relevant information")
        let row52 = FAQRowQuestionAnswer(question: "What should I do if the app doesn’t recognize a sign?",
                                         answer: "Ensure that the sign is clearly visible and well-lit. If it still doesn't recognize the sign, you can manually search for it in the app's database")
        let row53 = FAQRowQuestionAnswer(question: "Can I submit new road signs to the app?",
                                         answer: "Yes, users can submit new signs for review, which may be included in future updates")
        let section5 = FAQSection(header: "Usage",
                                  rows: [row51, row52, row53])
        
        // Section 6: Technical
        let row61 = FAQRowQuestionAnswer(question: "What devices are compatible with this app?",
                                         answer: "The app is compatible with iPhones and iPads running iOS 12.0 or later")
        let row62 = FAQRowQuestionAnswer(question: "Do I need to enable location services?",
                                         answer: "While not mandatory, enabling location services can enhance the app's functionality by providing context for the recognized signs")
        let row63 = FAQRowQuestionAnswer(question: "Is my data safe with this app?",
                                         answer: "Yes, the app adheres to strict data privacy policies and does not collect personal information without your consent")
        let section6 = FAQSection(header: "Technical",
                                  rows: [row61, row62, row63])
        
        // Section 7: Troubleshooting
        let row71 = FAQRowQuestionAnswer(question: "What should I do if the app crashes?",
                                         answer: "Try restarting the app or your device. If the problem persists, consider reinstalling the app or reaching out to customer support")
        let row72 = FAQRowQuestionAnswer(question: "Why is the app taking a long time to recognize a sign?",
                                         answer: "Recognition speed may be affected by camera quality, lighting conditions, and the complexity of the sign. Ensure good lighting and a clear view of the sign")
        let section7 = FAQSection(header: "Troubleshooting",
                                  rows: [row71, row72])
        
        // Section 8: Support
        let row81 = FAQRowQuestionAnswer(question: "How can I contact customer support?",
                                         answer: "You can reach customer support through the app's settings menu or by visiting our website for assistance")
        let row82 = FAQRowQuestionAnswer(question: "Where can I find tutorials or guides for using the app?",
                                         answer: "The app includes a help section with tutorials, and you can also find resources on our website and YouTube channel")
        let section8 = FAQSection(header: "Support",
                                  rows: [row81, row82])
        
        // Section 9: Updates
        let row91 = FAQRowQuestionAnswer(question: "Will the app receive regular updates?",
                                         answer: "Yes, we regularly update the app to improve features, add new road signs, and enhance performance based on user feedback")
        let row92 = FAQRowQuestionAnswer(question: "How can I provide feedback or suggestions for the app?",
                                         answer: "We welcome user feedback! You can submit your suggestions through the app's feedback section or contact us via email")
        let section9 = FAQSection(header: "Updates",
                                  rows: [row91, row92])
        
        return FAQData(sections: [section1, section2, section3, section4, section5, section6, section7, section8, section9])
    }
}
