//
//  Array+Extension.swift
//  RoadSignDetection
//
//  Created by e1ernal on 25.06.2023.
//

import Foundation

extension Array {
    /// Allows accessing array elements by index
    subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else { return defaultValue() }
        return self[index]
    }
}
