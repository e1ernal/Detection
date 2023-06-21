//
//  DetailedCell.swift
//  RoadSignDetection
//
//  Created by e1ernal on 21.06.2023.
//

import Foundation
import UIKit

final class DetailedCell: UITableViewCell {
    
    private let labelName = UILabel()
    private let labelValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelValue.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelName)
        contentView.addSubview(labelValue)
        
        NSLayoutConstraint.activate([
            labelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            labelValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            labelValue.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        self.selectionStyle = .none
    }
    
    func setupCell(name: String?, value: String?) {
        guard let name = name else { return }
        labelName.text = name
        
        guard let value = value else { return }
        labelValue.text = value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
