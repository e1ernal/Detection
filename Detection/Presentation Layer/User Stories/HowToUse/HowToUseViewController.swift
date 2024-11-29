//
//  HowToUseTheAppViewController.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import UIKit

final class HowToUseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let howToUseData: HowToUseData
    private let howToUseView: HowToUseView
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        howToUseData = HowToUseData.configure()
        howToUseView = HowToUseView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(title: "How to use the app")
        howToUseView.configure(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        self.view = howToUseView
    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Protocols
    func numberOfSections(in tableView: UITableView) -> Int { howToUseData.sections.count }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return howToUseData.sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = howToUseData.sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeue(HowToUseCell.self, for: indexPath)
        cell.configure(number: row.number, title: row.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return howToUseData.sections[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return howToUseData.sections[section].footer
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: HowToUseViewController.self))") }
}
