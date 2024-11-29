//
//  Settings.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import Foundation

#warning("Сделать общую структуру для всех настроек")
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
        return SettingsSection(rows: ["FAQ"])
    }
    
    static func sectionAbout() -> SettingsSection {
        return SettingsSection(rows: ["About"])
    }
}
