//
//  Cells.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

enum Cells {
    case regular
    case signInfo
    case signDetection
    case detailedCell

    var getId: String {
        switch self {
        case .regular:
            return "regularCell"
        case .signInfo:
            return "signInfoCell"
        case .signDetection:
            return "signDetection"
        case .detailedCell:
            return "detailedCell"
        }
    }

    var getClass: AnyClass {
        switch self {
        case .regular:
            return UITableViewCell.self
        case .signInfo:
            return SignInfoCell.self
        case .signDetection:
            return SignDetectionCell.self
        case .detailedCell:
            return DetailedCell.self
        }
    }
}
