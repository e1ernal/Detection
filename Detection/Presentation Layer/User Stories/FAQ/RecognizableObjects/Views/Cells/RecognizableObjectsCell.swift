//
//  RecognizableObjectsCell.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import UIKit

final class RecognizableObjectsCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let spacing: CGFloat = 10
    private let imageHeight: CGFloat = 50
    private let imageWidth: CGFloat = 50
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .justified
        label.numberOfLines = 2
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let signImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        return stack
    }()
    
    override func configureView() {
        contentView.addSubview(signImageView)
        contentView.addSubview(textStackView)
        
        separatorInset.left = 2 * spacing + imageWidth
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            signImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            signImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            signImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            signImageView.widthAnchor.constraint(equalToConstant: imageWidth),
            signImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: spacing),
            signImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -spacing),
            
            textStackView.leadingAnchor.constraint(equalTo: signImageView.trailingAnchor, constant: spacing),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
            textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -spacing)
        ])
    }
    
    // MARK: - Public Methods
    func configure(title: String, subtitle: String, image: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        signImageView.image = UIImage(named: image)
    }
}
