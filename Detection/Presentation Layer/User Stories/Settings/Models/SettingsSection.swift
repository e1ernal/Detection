//
//  Settings.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import Foundation

struct SettingsSection {
    let header: String?
    let rows: [String]
    let footer: String?
    
    init(header: String? = nil, rows: [String], footer: String? = nil) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}

extension SettingsSection {
    static func sectionFAQ() -> SettingsSection {
        return SettingsSection(header: "FAQ",
                               rows: ["How to use the app", "Recognizable objects"])
    }
    
    static func sectionAbout() -> SettingsSection {
        return SettingsSection(rows: ["About"])
    }
}
