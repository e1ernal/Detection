//
//  ViewController+Extension.swift
//  RoadSignDetection
//
//  Created by e1ernal on 25.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationBar(title: String?, color: UIColor?) {
        if let title { self.title = title }
        if let color { self.view.backgroundColor = color }
    }
}
