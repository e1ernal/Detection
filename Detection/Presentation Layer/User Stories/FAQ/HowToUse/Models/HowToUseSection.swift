//
//  HowToUseDataSection.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

struct HowToUseSection {
    let header: String?
    let rows: [HowToUseDataRow]
    let footer: String?
    
    init(header: String? = nil, rows: [HowToUseDataRow], footer: String? = nil) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}

extension HowToUseSection {
    static func sectionHowToUse() -> HowToUseSection {
        let row1 = HowToUseDataRow.row1()
        let row2 = HowToUseDataRow.row2()
        let row3 = HowToUseDataRow.row3()
        
        let rows = [row1, row2, row3]
        
        return .init(rows: rows,
                     footer: "The model will try to find these road signs in the image. If the road sign is too small, it will not be found")
    }
}
