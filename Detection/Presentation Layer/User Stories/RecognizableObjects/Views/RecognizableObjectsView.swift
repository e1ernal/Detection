//
//  RecognizableObjectsView.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import UIKit

final class RecognizableObjectsView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var recognizableObjectsTableView = UITableView(frame: .zero, style: .insetGrouped)
    private var recognizableObjectView = RecognizableObjectView()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(recognizableObjectsTableView)
        addSubview(recognizableObjectView)
        
        recognizableObjectsTableView.register(RecognizableObjectsCell.self,
                                              forCellReuseIdentifier: RecognizableObjectsCell.reuseIdentifier)
        
        recognizableObjectView.isHidden = true
        recognizableObjectView.alpha = 0
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
            recognizableObjectsTableView.topAnchor.constraint(equalTo: topAnchor),
            recognizableObjectsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            recognizableObjectsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recognizableObjectsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            recognizableObjectView.topAnchor.constraint(equalTo: topAnchor),
            recognizableObjectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            recognizableObjectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recognizableObjectView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Public Actions
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        recognizableObjectsTableView.delegate = delegate
        recognizableObjectsTableView.dataSource = dataSource
    }
    
    func showRecognizableObjectView(title: String, subtitle: String, image: String) {
        recognizableObjectView.configure(title: title, subtitle: subtitle, image: image)
        
        recognizableObjectView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.recognizableObjectView.alpha = 1
        }
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: RecognizableObjectsView.self))") }
}
