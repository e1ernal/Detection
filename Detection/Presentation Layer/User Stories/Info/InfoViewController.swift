//
//  InfoVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import UIKit

final class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let infoData: InfoData
    private let infoSignsData: InfoSignsData
    private let infoView: InfoView
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        infoData = InfoData()
        infoSignsData = InfoSignsData()
        infoView = InfoView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(title: "Information")
        infoView.configure(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        self.view = infoView
    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Protocols
    func numberOfSections(in tableView: UITableView) -> Int { 2 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return infoData.rows.count
        case 1:
            return infoSignsData.rows.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let row = infoData.rows[indexPath.row]
            let cell = tableView.dequeue(InfoCell.self, for: indexPath)
            cell.configure(number: row.0, title: row.1)
            return cell
        case 1:
            let row = infoSignsData.rows[indexPath.row]
            let cell = tableView.dequeue(InfoSignCell.self, for: indexPath)
            cell.configure(title: row.title, subtitle: row.subtitle, image: row.image)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "What to do"
        case 1:
            return "Recognizable road signs"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 1:
            return "The model will try to find these road signs in the image. If the road sign is too small, it will not be found"
        default:
            return ""
        }
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: InfoViewController.self))") }
}
