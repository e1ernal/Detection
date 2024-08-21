//
//  CustomTableViewCell.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import UIKit

final class InfoSignCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let spacing: CGFloat = 10
    private let imageHeight: CGFloat = 50
    private let imageWidth: CGFloat = 50
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    override func configureView() {
        contentView.addSubview(signImageView)
        contentView.addSubview(textStackView)
        
        self.selectionStyle = .none
        separatorInset.left = 2 * spacing + imageWidth
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            signImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            signImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            signImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            signImageView.widthAnchor.constraint(equalToConstant: imageWidth),
            
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
