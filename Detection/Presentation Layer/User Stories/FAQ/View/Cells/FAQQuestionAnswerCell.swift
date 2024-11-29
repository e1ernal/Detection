//
//  FAQQuestionAnswerCell.swift
//  Detection
//
//  Created by e1ernal on 29.11.2024.
//

import UIKit

final class FAQQuestionAnswerCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .title
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .subtitle
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()
    
    override func configureView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        selectionStyle = .none
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .spacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.spacing),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spacing),

            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .spacing),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.spacing),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.spacing)
        ])
    }
    
    // MARK: - Public Methods
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
