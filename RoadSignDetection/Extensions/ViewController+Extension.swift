//
//  ViewController+Extension.swift
//  RoadSignDetection
//
//  Created by e1ernal on 25.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationBar(title: String?, backgroundColor: UIColor?) {
        if let title {
            self.title = title
        }

        guard let color = backgroundColor else { return }
        self.view.backgroundColor = color
    }
}
