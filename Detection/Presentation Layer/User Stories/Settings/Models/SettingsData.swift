//
//  Settings.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import Foundation

struct SettingsData {
    let sections: [SettingsSection]
    
    init(sections: [SettingsSection]) {
        self.sections = sections
    }
}

extension SettingsData {
    static func configure() -> SettingsData {
        let sectionFAQ = SettingsSection.sectionFAQ()
        let sectionAbout = SettingsSection.sectionAbout()
        
        return SettingsData(sections: [sectionFAQ, sectionAbout])
    }
}
