//
//  HowToUseDataRow.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

struct HowToUseRow {
    let number: String
    let title: String
    
    init(step: String, title: String) {
        self.number = step
        self.title = title
    }
}

extension HowToUseRow {
    static func row1() -> HowToUseRow {
        return HowToUseRow(step: "1",
                               title: "Select an image that contains road signs")
    }
    
    static func row2() -> HowToUseRow {
        return HowToUseRow(step: "2",
                               title: "The application will process the image and highlight all recognized road signs")
    }
    
    static func row3() -> HowToUseRow {
        return HowToUseRow(step: "3",
                               title: "You can view detailed information on each recognized road sign")
    }
}
