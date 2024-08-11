//
//  MenuVC+TableView.swift
//  RoadSignDetection
//
//  Created by e1ernal on 04.09.2023.
//

import Foundation
import UIKit

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        menuTableView.delegate = self
        menuTableView.dataSource = self

        view.addSubview(menuTableView)
        menuTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: view.topAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        menuTableView.register(Cells.regular.getClass, forCellReuseIdentifier: Cells.regular.getId)

        menuButtons = MenuButtons.getMenuButtons()
        menuTableView.alwaysBounceVertical = false
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuButtons[section].cells.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuButtons[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return menuButtons[section].footer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.regular.getId, for: indexPath)
        let menuButton = menuButtons[indexPath.section].cells[indexPath.row]
        cell.textLabel?.text = menuButton.title
        cell.imageView?.image = UIImage(systemName: menuButton.systemImage)
        cell.tintColor = .label
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var nextVC = UIViewController()
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                nextVC = InfoVC()
            case 1:
                nextVC = AboutVC()
            default:
                return
            }
        navigationController?.present(UINavigationController(rootViewController: nextVC),
                                      animated: true)
        default:
            return
        }
    }
}
