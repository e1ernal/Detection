//
//  RecognizableObjectsData.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import Foundation

struct RecognizableObjectsData {
    let sections: [RecognizableObjectsSection]
    
    init(sections: [RecognizableObjectsSection]) {
        self.sections = sections
    }
}

extension RecognizableObjectsData {
    static func configure() -> RecognizableObjectsData {
        let section1 = RecognizableObjectsSection.sectionPrioritySigns()
        let section2 = RecognizableObjectsSection.sectionTrafficLights()
        let section3 = RecognizableObjectsSection.sectionPedestriansAndCyclingSigns()
        let section4 = RecognizableObjectsSection.sectionTrafficSigns()
        let section5 = RecognizableObjectsSection.sectionProhibitingAndLimitingSigns()
        
        let sections = [section1, section2, section3, section4, section5]
        
        return .init(sections: sections)
    }
}
