//
//  AboutVC.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import UIKit

final class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    let aboutData: AboutData
    var aboutView: AboutView
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        aboutData = AboutData()
        aboutView = AboutView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(title: "About")
        aboutView.configure(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        self.view = aboutView
    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Protocols
    func numberOfSections(in tableView: UITableView) -> Int {
        return aboutData.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return aboutData.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = aboutData.sections[indexPath.section].row
        let cell = tableView.dequeue(AboutCell.self, for: indexPath)
        cell.configure(title: row)
        return cell
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: AboutViewController.self))") }
}
