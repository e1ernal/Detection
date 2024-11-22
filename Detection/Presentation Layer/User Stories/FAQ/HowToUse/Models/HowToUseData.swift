//
//  HowToUseData.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import Foundation

struct HowToUseData {
    let sections: [HowToUseDataSection]
    
    init(sections: [HowToUseDataSection]) {
        self.sections = sections
    }
}

extension HowToUseData {
    static func configure() -> HowToUseData {
        let sectionHowToUse = HowToUseDataSection.sectionHowToUse()
        
        return HowToUseData(sections: [sectionHowToUse])
    }
}
