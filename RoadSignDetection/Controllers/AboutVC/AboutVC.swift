//
//  AboutVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import UIKit

class AboutVC: UIViewController {
    lazy var aboutTableView = UITableView(frame: .zero, style: .insetGrouped)
    var sections: [Section] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "About",
                           color: .systemBackground)
        setupTableView()
    }
}
