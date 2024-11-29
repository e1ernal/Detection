//
//  MenuVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 04.09.2023.
//

import UIKit

final class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    let settingsData: SettingsData
    var settingsView: SettingsView
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        settingsData = SettingsData.configure()
        settingsView = SettingsView()
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
        settingsView.configure(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        self.view = settingsView
    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Protocols
    // UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsData.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        settingsData.sections[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        settingsData.sections[section].footer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = settingsData.sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeue(SettingsCell.self, for: indexPath)
        cell.configure(title: row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC: UIViewController
        let section = indexPath.section
        
        guard section < settingsData.sections.count else { return }
        
        nextVC = section == 0 ? FAQViewController() : AboutViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: SettingsViewController.self))") }
}
