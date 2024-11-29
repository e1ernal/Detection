//
//  FAQView.swift
//  Detection
//
//  Created by e1ernal on 29.11.2024.
//

import UIKit

final class FAQView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var faqTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(faqTableView)
        
        faqTableView.register(FAQQuestionAnswerCell.self, forCellReuseIdentifier: FAQQuestionAnswerCell.reuseIdentifier)
        faqTableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseIdentifier)
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
            faqTableView.topAnchor.constraint(equalTo: topAnchor),
            faqTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            faqTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            faqTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Public Actions
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        faqTableView.delegate = delegate
        faqTableView.dataSource = dataSource
    }
    
    func refresh() {
        faqTableView.reloadData()
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: FAQView.self))") }
}
