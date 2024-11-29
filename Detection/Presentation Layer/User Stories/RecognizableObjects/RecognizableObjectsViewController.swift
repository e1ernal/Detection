//
//  RecognizableObjects.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import UIKit

final class RecognizableObjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let recognizableObjectsData: RecognizableObjectsData
    private let recognizableObjectsView: RecognizableObjectsView
    
    // MARK: - Initialization
    init() {
        // Init optional properties
        recognizableObjectsData = RecognizableObjectsData.configure()
        recognizableObjectsView = RecognizableObjectsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(title: "Recognizable Objects")
        recognizableObjectsView.configure(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        self.view = recognizableObjectsView
    }
    
    // MARK: - Actions
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Protocols
    func numberOfSections(in tableView: UITableView) -> Int { recognizableObjectsData.sections.count }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recognizableObjectsData.sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = recognizableObjectsData.sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeue(RecognizableObjectsCell.self, for: indexPath)
        cell.configure(title: row.title, subtitle: row.subtitle, image: row.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        recognizableObjectsData.sections[section].header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        recognizableObjectsData.sections[section].footer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = recognizableObjectsData.sections[indexPath.section].rows[indexPath.row]
        recognizableObjectsView.showRecognizableObjectView(title: row.title, subtitle: row.subtitle, image: row.image)
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: RecognizableObjectsViewController.self))") }
}
