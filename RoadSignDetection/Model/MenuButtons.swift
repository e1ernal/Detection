//
//  MenuButtons.swift
//  RoadSignDetection
//
//  Created by e1ernal on 04.09.2023.
//

import Foundation

struct MenuButton {
    let title: String
    let systemImage: String
}

struct MenuSection {
    let header: String
    let footer: String
    let cells: [MenuButton]
}

enum MenuButtons {
    static func getMenuButtons() -> [MenuSection] {
        return [
            MenuSection(header: "FAQ",
                        footer: "",
                        cells: [
                            MenuButton(title: "How to use",
                                       systemImage: "questionmark"),
                            MenuButton(title: "About",
                                       systemImage: "info")
                        ])
        ]
    }
}
