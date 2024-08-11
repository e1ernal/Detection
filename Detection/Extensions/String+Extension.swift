//
//  String+Extension.swift
//  RoadSignDetection
//
//  Created by e1ernal on 25.06.2023.
//

import Foundation

extension String {
    /// Translates results of MLModel from russian to english
    /// - Returns: English named label
    func mlModelLabel() -> String {
        switch self {
        case "Въезд запрещен":
            return "Entry is prohibited"
        case "Главная дорога":
            return "Priority road"
        case "Остановка запрещена":
            return "Stopping is prohibited"
        case "Парковка":
            return "Parking"
        case "Пешеходный переход":
            return "Pedestrian crossing"
        default:
            return "Unknown Label"
        }
    }
}
