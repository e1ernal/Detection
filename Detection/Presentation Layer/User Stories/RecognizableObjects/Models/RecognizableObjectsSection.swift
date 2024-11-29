//
//  RecognizableObjectsSection.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

struct RecognizableObjectsSection {
    let header: String?
    let rows: [RecognizableObjectsRow]
    let footer: String?
    
    init(header: String? = nil, rows: [RecognizableObjectsRow] = [], footer: String? = nil) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}

extension RecognizableObjectsSection {
    static func sectionProhibitingAndLimitingSigns() -> RecognizableObjectsSection {
        let row1 = RecognizableObjectsRow.row9()
        let row2 = RecognizableObjectsRow.row2()
        let row3 = RecognizableObjectsRow.row5()
        let row4 = RecognizableObjectsRow.row6()
        let row5 = RecognizableObjectsRow.row7()
        let row6 = RecognizableObjectsRow.row8()
        let row7 = RecognizableObjectsRow.row10()
        let row8 = RecognizableObjectsRow.row11()
        let row9 = RecognizableObjectsRow.row12()
        
        let rows = [row1, row2, row3, row4, row5, row6, row7, row8, row9]
        
        return .init(header: "Prohibiting and limiting signs",
                     rows: rows)
    }
    
    static func sectionTrafficSigns() -> RecognizableObjectsSection {
        let row1 = RecognizableObjectsRow.row13()
        let row2 = RecognizableObjectsRow.row14()
        let row3 = RecognizableObjectsRow.row15()
        let row4 = RecognizableObjectsRow.row16()
        let row5 = RecognizableObjectsRow.row17()
        let row6 = RecognizableObjectsRow.row18()
        let row7 = RecognizableObjectsRow.row19()
        let row8 = RecognizableObjectsRow.row20()
        let row9 = RecognizableObjectsRow.row21()
        let row10 = RecognizableObjectsRow.row22()
        
        let rows = [row1, row2, row3, row4, row5, row6, row7, row8, row9, row10]
        
        return .init(header: "Traffic signs", rows: rows)
    }
    
    static func sectionPedestriansAndCyclingSigns() -> RecognizableObjectsSection {
        let row1 = RecognizableObjectsRow.row4()
        let row2 = RecognizableObjectsRow.row23()
        let row3 = RecognizableObjectsRow.row24()
        let row4 = RecognizableObjectsRow.row25()
        
        let rows = [row1, row2, row3, row4]
        
        return .init(header: "Pedestrians and cycling signs", rows: rows)
    }
    
    static func sectionTrafficLights() -> RecognizableObjectsSection {
        let row1 = RecognizableObjectsRow.row26()
        let row2 = RecognizableObjectsRow.row27()
        let row3 = RecognizableObjectsRow.row28()
        
        let rows = [row1, row2, row3]
        
        return .init(header: "Traffic lights", rows: rows)
    }
    
    static func sectionPrioritySigns() -> RecognizableObjectsSection {
        let row1 = RecognizableObjectsRow.row3()
        
        let rows = [row1]
        
        return .init(header: "Priority signs", rows: rows)
    }
}
