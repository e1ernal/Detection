//
//  DetectionSection.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

struct DetectionSection {
    var header: String?
    var rows: [DetectionRowProtocol]
    var footer: String?
    
    init(header: String? = nil, rows: [DetectionRowProtocol], footer: String? = nil) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}
