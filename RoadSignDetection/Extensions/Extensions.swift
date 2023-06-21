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

extension Array {
    public subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else {
            return defaultValue()
        }

        return self[index]
    }
}

//MARK: Draw rectangle on image
final class Draw {
    static func rectangles(image: UIImage, boundingBoxes: [CGRect], texts: [String]) -> UIImage {
        let imageSize = image.size
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)
        
        image.draw(at: CGPoint.zero)
        
        for (boundingBox, text) in zip(boundingBoxes, texts) {
            let x = boundingBox.minX * image.size.width
            let y = (1 - boundingBox.minY - boundingBox.height) * image.size.height
            let width = boundingBox.width * image.size.width
            let height = boundingBox.height * image.size.height
            
            let rectangle = CGRect(x: x,
                                   y: y,
                                   width: width,
                                   height: height)
            UIColor(red: 0, green: 1, blue: 0, alpha: 0.4).setFill()
            UIRectFillUsingBlendMode(rectangle, CGBlendMode.normal)
            
            let textRectangle = CGRect(x: x - 100,
                                       y: y - 50,
                                       width: width + 200,
                                       height: 100)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            paragraphStyle.firstLineHeadIndent = 5.0
            
            let strokeTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.backgroundColor: UIColor.white,
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .heavy)]
            as [NSAttributedString.Key : Any]
            
            text.draw(in: textRectangle, withAttributes: strokeTextAttributes)
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let newImage = newImage else { return UIImage() }
        return newImage
    }
}
