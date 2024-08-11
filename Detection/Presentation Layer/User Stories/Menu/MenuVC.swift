//
//  MenuVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 04.09.2023.
//

import UIKit

class MenuVC: UIViewController {
    lazy var menuTableView = UITableView(frame: .zero, style: .insetGrouped)
    var menuButtons: [MenuSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configure(title: "Menu")
        setupTableView()
    }
}
