//
//  InfoCell.swift
//  Detection
//
//  Created by e1ernal on 11.08.2024.
//

import UIKit

final class HowToUseCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = .title
        label.textColor = .secondaryLabel
        label.text = "0"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .subtitle
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    override func configureView() {
        contentView.addSubview(numberLabel)
        contentView.addSubview(titleLabel)
        
        self.selectionStyle = .none
        separatorInset.left = 2 * .spacing + numberLabel.intrinsicContentSize.width
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spacing),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.spacing),
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .spacing),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spacing),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.spacing),
            titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: .spacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.spacing)
        ])
    }
    
    // MARK: - Public Methods
    func configure(number: String, title: String) {
        numberLabel.text = number
        titleLabel.text = title
        layoutIfNeeded()
    }
}
