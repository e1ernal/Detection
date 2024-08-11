//
//  MainVC+NavigationBar.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

extension MainVC {
    @objc
    func infoTapped() {
        let smallDetentId = UISheetPresentationController.Detent.Identifier("small")
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallDetentId) { _ in
            return 300
        }
        
        let nextVC = UINavigationController(rootViewController: MenuVC())
        nextVC.sheetPresentationController?.detents = [smallDetent]
        nextVC.sheetPresentationController?.prefersGrabberVisible = true
        navigationController?.present(nextVC, animated: true)
    }

    func setupActions() {
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(infoTapped))
        infoButton.tintColor = .label
        self.navigationItem.rightBarButtonItem = infoButton
    }
}
