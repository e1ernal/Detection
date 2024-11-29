//
//  HowToUseData.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import Foundation

struct HowToUseData {
    let sections: [HowToUseSection]
    
    init(sections: [HowToUseSection]) {
        self.sections = sections
    }
}

extension HowToUseData {
    static func configure() -> HowToUseData {
        let section1 = HowToUseSection.sectionHowToUse()
        let sections = [section1]
        
        return .init(sections: sections)
    }
}
