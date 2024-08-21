//
//  Settings.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import Foundation

struct SettingsData {
    let sections: [SettingsSection]
    
    init() {
        self.sections = [SettingsSection.faqSection()]
    }
}
