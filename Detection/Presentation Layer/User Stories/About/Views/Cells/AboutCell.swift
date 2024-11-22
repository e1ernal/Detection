//
//  AboutCell.swift
//  Detection
//
//  Created by e1ernal on 12.08.2024.
//

import UIKit

final class AboutCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let spacing: CGFloat = 10
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    override func configureView() {
        addSubview(titleLabel)
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: spacing),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacing)
        ])
    }
    
    // MARK: - Public Methods
    func configure(title: String) {
        self.titleLabel.text = title
    }
}
