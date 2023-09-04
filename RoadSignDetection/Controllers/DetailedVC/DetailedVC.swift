//
//  DetailedVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 21.06.2023.
//

import Foundation
import UIKit
import Vision

class DetailedVC: UIViewController {
    lazy var infoTableView = UITableView(frame: .zero, style: .insetGrouped)
    var signs: [VNRecognizedObjectObservation] = []
    var originalImage = UIImage()
    var signImages: [UIImage?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Detailed information",
                           color: .systemBackground)
        drawSignImages()
        setupTableView()
    }
    
    func drawSignImages() {
        for sign in signs {
            let signImage = Draw.rectangles(image: originalImage,
                                            boundingBoxes: [sign.boundingBox],
                                            texts: [sign.labels[0].identifier.mlModelLabel()])
            signImages.append(signImage)
        }
    }
}
