//
//  MenuVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 04.09.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    let data: Settings
    lazy var menuTableView = UITableView(frame: .zero, style: .insetGrouped)
//    var menuView: UIView
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        data = Settings()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(title: "Settings")
        setupTableView()
    }
    
//    override func loadView() {
//        self.view = UIView()
//    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: SettingsViewController.self))") }
}
