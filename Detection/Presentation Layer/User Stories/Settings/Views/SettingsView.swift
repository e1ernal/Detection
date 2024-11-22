//
//  SettingsView.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import UIKit

final class SettingsView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var settingsTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(settingsTableView)
        
        settingsTableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseIdentifier)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Configure constraints
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: topAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Public Actions
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        settingsTableView.delegate = delegate
        settingsTableView.dataSource = dataSource
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: SettingsView.self))") }
}
