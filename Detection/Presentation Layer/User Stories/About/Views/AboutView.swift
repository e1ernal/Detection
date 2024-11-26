//
//  AboutView.swift
//  Detection
//
//  Created by e1ernal on 12.08.2024.
//

import UIKit

final class AboutView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var aboutTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(aboutTableView)
        
        aboutTableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.reuseIdentifier)
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
            aboutTableView.topAnchor.constraint(equalTo: topAnchor),
            aboutTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            aboutTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            aboutTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Public Actions
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        aboutTableView.delegate = delegate
        aboutTableView.dataSource = dataSource
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: AboutView.self))") }
}
