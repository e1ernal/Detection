//
//  UINavigationItem.swift
//  Detection
//
//  Created by e1ernal on 14.08.2024.
//

import UIKit

extension UINavigationItem {
    func configureTitleView(title: String, subtitle: String = "", animating: Bool = false) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .label
        
        let subtitleStackView = UIStackView()
        subtitleStackView.axis = .horizontal
        subtitleStackView.alignment = .center
        subtitleStackView.spacing = 10
        
        if animating {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.style = .medium
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            subtitleStackView.addArrangedSubview(activityIndicator)
        }
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textColor = .secondaryLabel
        subtitleStackView.addArrangedSubview(subtitleLabel)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleStackView])
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.layoutSubviews()
        
        self.titleView = stackView
    }
}
