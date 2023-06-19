//
//  VC+NavigationBar.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationBar(title: String?, backgroundColor: UIColor?) {
        guard let title = title else { return }
        self.title = title
        
        guard let color = backgroundColor else { return }
        self.view.backgroundColor = color
    }
}

extension String {
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
