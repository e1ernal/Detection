//
//  Settings.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import Foundation

struct SettingsDataSection {
    let rows: [String]
}

extension SettingsDataSection {
    static func faqSection() -> SettingsDataSection {
        SettingsDataSection(rows: ["How to use", "About"])
    }
}
