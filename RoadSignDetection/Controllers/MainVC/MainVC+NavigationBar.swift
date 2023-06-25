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
        let nextVC = InfoVC()
        navigationController?.present(UINavigationController(rootViewController: nextVC),
                                      animated: true)
    }

    func setupActions() {
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(infoTapped))
        self.navigationItem.rightBarButtonItem = infoButton
    }
}
