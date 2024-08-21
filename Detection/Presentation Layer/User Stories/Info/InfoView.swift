//
//  InfoView.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import UIKit

final class InfoView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var infoTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(infoTableView)
        
        infoTableView.register(InfoSignCell.self, forCellReuseIdentifier: InfoSignCell.reuseIdentifier)
        infoTableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.reuseIdentifier)
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
            infoTableView.topAnchor.constraint(equalTo: topAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Public Actions
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        infoTableView.delegate = delegate
        infoTableView.dataSource = dataSource
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: InfoView.self))") }
}
