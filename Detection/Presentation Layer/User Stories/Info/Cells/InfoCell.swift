//
//  InfoCell.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import UIKit

final class InfoCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let spacing: CGFloat = 10
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func configureView() {
        contentView.addSubview(numberLabel)
        contentView.addSubview(titleLabel)
        
        self.selectionStyle = .none
        separatorInset.left = 2 * spacing + numberLabel.intrinsicContentSize.width
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -spacing),
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -spacing),
            titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: spacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing)
        ])
    }
    
    // MARK: - Public Methods
    func configure(number: String, title: String) {
        numberLabel.text = number
        titleLabel.text = title
        layoutIfNeeded()
    }
}