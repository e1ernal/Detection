//
//  FAQSectionn.swift
//  Detection
//
//  Created by e1ernal on 29.11.2024.
//

#warning("Генерировать контент настроек через JSON")
struct FAQSection {
    var header: String?
    var rows: [FAQRowProtocol]
    var footer: String?
    
    init(header: String? = nil, rows: [FAQRowProtocol], footer: String? = nil) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}
