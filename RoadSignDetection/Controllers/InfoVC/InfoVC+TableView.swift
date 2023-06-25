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
        infoTableView.alwaysBounceVertical = false

        signs = Signs.getSigns()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return signs.count
        case 1:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
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
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.regular.getId, for: indexPath)
            cell.textLabel?.text = "About"
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: Cells.regular.getId, for: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Recognizable road signs"
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 && indexPath.row == 0 {
            let nextVC = AboutVC()
            navigationController?.present(UINavigationController(rootViewController: nextVC),
                                          animated: true)
        }
    }
}
