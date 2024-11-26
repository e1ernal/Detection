//
//  DetectionImageCell.swift
//  Detection
//
//  Created by e1ernal on 22.11.2024.
//

import UIKit

final class DetectionImageCell: TableViewCell {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let signImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    override func configureView() {
        contentView.addSubview(signImageView)
        
        selectionStyle = .none
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            signImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            signImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            signImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    func configure(image: UIImage) {
        signImageView.image = image
    }
}
