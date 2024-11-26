//
//  DetectionView.swift
//  Detection
//
//  Created by e1ernal on 12.08.2024.
//

import UIKit

final class DetectionView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var detectionTableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(detectionTableView)
        
        detectionTableView.register(DetectionImageCell.self, forCellReuseIdentifier: DetectionImageCell.reuseIdentifier)
        detectionTableView.register(DetectionSignCell.self, forCellReuseIdentifier: DetectionSignCell.reuseIdentifier)
        detectionTableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.reuseIdentifier)
        detectionTableView.register(DetectionCallCell.self, forCellReuseIdentifier: DetectionCallCell.reuseIdentifier)
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
            detectionTableView.topAnchor.constraint(equalTo: topAnchor),
            detectionTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            detectionTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detectionTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    // MARK: - Public Actions
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        detectionTableView.delegate = delegate
        detectionTableView.dataSource = dataSource
    }
    
    func refresh(empty: Bool) {
        DispatchQueue.main.async {
            var backgroundView: UIView? = nil
            
            if empty {
                let label = UILabel()
                label.textAlignment = .center
                label.numberOfLines = 0
                
                let attributedText = NSMutableAttributedString()
                let title = "Press + to select an image"
                let subTitle = "\nObjects in the photo must be at least 10% of the size of the image"
                let fullText = NSMutableAttributedString(string: title + subTitle)
                attributedText.append(fullText)
                
                let mainFontSizeAttribute = [NSAttributedString.Key.font: UIFont.title]
                let secondaryFontSizeAttribute = [NSAttributedString.Key.font: UIFont.subtitle]
                let mainColorAttribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
                let secondaryColorAttribute = [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]
                
                attributedText.addAttributes(mainFontSizeAttribute, range: NSRange(location: 0, length: title.count))
                attributedText.addAttributes(secondaryFontSizeAttribute, range: NSRange(location: title.count, length: subTitle.count))
                attributedText.addAttributes(secondaryColorAttribute, range: NSRange(location: title.count, length: subTitle.count))
                attributedText.addAttributes(mainColorAttribute, range: NSRange(location: 0, length: title.count))
                
                label.attributedText = attributedText
                
                let containerView = UIView()
                containerView.layer.cornerRadius = 10
                containerView.backgroundColor = .secondarySystemGroupedBackground
                
                let view = UIView()
                view.addSubview(containerView)
                view.addSubview(label)
                
                // Set constraints for the label
                NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                    
                    containerView.topAnchor.constraint(equalTo: label.topAnchor, constant: -.spacing),
                    containerView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: .spacing),
                    containerView.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -.spacing),
                    containerView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: .spacing)
                ])
                
                backgroundView = view
            }
            
            self.detectionTableView.backgroundView = backgroundView
            self.detectionTableView.reloadData()
        }
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: DetectionView.self))") }
}
