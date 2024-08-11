//
//  VC+NavigationBar.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

/// Draw rectangle on image
enum Draw {
    static func rectangles(image: UIImage, boundingBoxes: [CGRect], texts: [String]) -> UIImage {
        let imageSize = image.size
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)

        image.draw(at: CGPoint.zero)

        for (boundingBox, text) in zip(boundingBoxes, texts) {
            let xBox = boundingBox.minX * image.size.width
            let yBox = (1 - boundingBox.minY - boundingBox.height) * image.size.height
            let width = boundingBox.width * image.size.width
            let height = boundingBox.height * image.size.height

            let rectangle = CGRect(x: xBox,
                                   y: yBox,
                                   width: width,
                                   height: height)
            UIColor(red: 0, green: 1, blue: 0, alpha: 0.4).setFill()
            UIRectFillUsingBlendMode(rectangle, CGBlendMode.normal)

            let textRectangle = CGRect(x: xBox - 100,
                                       y: yBox - 50,
                                       width: width + 200,
                                       height: 100)

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            paragraphStyle.firstLineHeadIndent = 5.0

            let strokeTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.backgroundColor: UIColor.white,
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .heavy)
            ] as [NSAttributedString.Key: Any]

            text.draw(in: textRectangle, withAttributes: strokeTextAttributes)
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let newImage else {
            return UIImage()
        }
        return newImage
    }
}
