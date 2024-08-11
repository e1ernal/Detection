//
//  SignDetectionCell.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import Foundation
import UIKit

final class SignDetectionCell: UITableViewCell {
    private let signImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        signImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(signImage)
        
        NSLayoutConstraint.activate([
            signImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            signImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            signImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        self.selectionStyle = .none
    }
    
    func setupCell(image: UIImage?) {
        if let image {
            signImage.image = image
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
