//
//  InfoVC+TableView.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

extension InfoVC: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        infoTableView.delegate = self
        infoTableView.dataSource = self

        view.addSubview(infoTableView)
        infoTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        infoTableView.register(Cells.signInfo.getClass, forCellReuseIdentifier: Cells.signInfo.getId)
        infoTableView.register(Cells.regular.getClass, forCellReuseIdentifier: Cells.regular.getId)
        infoTableView.allowsSelection = false
        
        signs = Signs.getSigns()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return signs.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Cells.signInfo.getId,
                for: indexPath) as? SignInfoCell
            else {
                fatalError("DequeueReusableCell failed while casting")
            }
            let sign = signs[indexPath.row]
            cell.setupCell(name: sign.name,
                           definition: sign.definition,
                           imageName: sign.imageName)
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: Cells.regular.getId, for: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "Recognizable road signs"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return """
                1. Select an image that contains road signs
                
                2. The application will process the image and highlight all recognized road signs
                
                3. You can view detailed information on each recognized road sign
                """
        case 1:
            return "The model will try to find these road signs in the image. If the road sign is too small, it will not be found"
        default:
            return ""
        }
    }
}
