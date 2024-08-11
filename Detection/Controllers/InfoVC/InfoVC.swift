//
//  InfoVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import UIKit

class InfoVC: UIViewController {
    lazy var infoTableView = UITableView(frame: .zero, style: .insetGrouped)
    var signs: [Sign] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "How to use",
                           color: .systemBackground)
        setupTableView()
    }
}
