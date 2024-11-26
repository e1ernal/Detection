//
//  DetectionCallCell.swift
//  Detection
//
//  Created by e1ernal on 26.11.2024.
//

import UIKit

final class DetectionCallCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let imageHeight: CGFloat = 35
    private let imageWidth: CGFloat = 35
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .title
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .label
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .subtitle
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let callButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "phone.fill")
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .tertiarySystemGroupedBackground
        configuration.baseForegroundColor = .systemGreen
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    private let messageButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "message.fill")
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .tertiarySystemGroupedBackground
        configuration.baseForegroundColor = .systemGreen
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.spacing = .spacing
        return stack
    }()
    
    override func configureView() {
        contentView.addSubview(callButton)
        contentView.addSubview(messageButton)
        contentView.addSubview(textStackView)
        
        selectionStyle = .none
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            callButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.spacing),
            callButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            callButton.heightAnchor.constraint(equalToConstant: imageHeight),
            callButton.widthAnchor.constraint(equalToConstant: imageWidth),
            callButton.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: .spacing),
            callButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -.spacing),
            
            messageButton.trailingAnchor.constraint(equalTo: callButton.leadingAnchor, constant: -.spacing),
            messageButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            messageButton.heightAnchor.constraint(equalToConstant: imageHeight),
            messageButton.widthAnchor.constraint(equalToConstant: imageWidth),
            messageButton.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: .spacing),
            messageButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -.spacing),
            
            textStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .spacing),
            textStackView.trailingAnchor.constraint(equalTo: messageButton.leadingAnchor, constant: -.spacing),
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spacing),
            textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.spacing),
        ])
    }
    
    // MARK: - Public Methods
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
