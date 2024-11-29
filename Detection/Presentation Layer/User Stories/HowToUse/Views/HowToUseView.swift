//
//  HowToUseView.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import UIKit

final class HowToUseView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var howToUseTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(howToUseTableView)
        
        howToUseTableView.register(HowToUseCell.self, forCellReuseIdentifier: HowToUseCell.reuseIdentifier)
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
            howToUseTableView.topAnchor.constraint(equalTo: topAnchor),
            howToUseTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            howToUseTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            howToUseTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    // MARK: - Public Actions
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        howToUseTableView.delegate = delegate
        howToUseTableView.dataSource = dataSource
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: HowToUseView.self))") }
}
