//
//  NSLayoutConstraint.swift
//  Detection
//
//  Created by e1ernal on 20.08.2024.
//

import UIKit

extension NSLayoutConstraint {
    static func activate(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach {
            ($0.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            $0.isActive = true
        }
    }
}
