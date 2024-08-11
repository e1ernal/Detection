//
//  Reusable.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import UIKit

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: UIView {
    static var reuseIdentifier: String { String(describing: self) }
}
