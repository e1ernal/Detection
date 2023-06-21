//
//  CustomTableViewCell.swift
//  RoadSignDetection
//
//  Created by e1ernal on 18.06.2023.
//

import Foundation
import UIKit

final class SignInfoCell: UITableViewCell {
    
    private let signName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let signDefinition: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 13)
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    private let signImage = UIImageView()
    
    private lazy var nameStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signName, signDefinition])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        signName.translatesAutoresizingMaskIntoConstraints = false
        signDefinition.translatesAutoresizingMaskIntoConstraints = false
        signImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(signImage)
        contentView.addSubview(nameStack)
        
        NSLayoutConstraint.activate([
            signImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            signImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            signImage.heightAnchor.constraint(equalToConstant: 50),
            signImage.widthAnchor.constraint(equalToConstant: 50),
            
            nameStack.leadingAnchor.constraint(equalTo: signImage.trailingAnchor, constant: 10),
            nameStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        self.selectionStyle = .none
    }
    
    func setupCell(name: String, definition: String, imageName: String) {
        signName.text = name
        signDefinition.text = definition
        signImage.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
