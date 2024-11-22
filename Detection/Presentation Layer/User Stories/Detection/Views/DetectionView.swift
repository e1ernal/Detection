//
//  DetectionView.swift
//  Detection
//
//  Created by e1ernal on 12.08.2024.
//

import UIKit

final class DetectionView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let detectionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.isHidden = true
        return imageView
    }()
    
    var heightConstraint = NSLayoutConstraint()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString()
        let title = "Press + to select an image"
        let subTitle = "\nObjects in the photo must be at least 10% of the size of the image"
        let fullText = NSMutableAttributedString(string: title + subTitle)
        attributedText.append(fullText)
        
        let mainFontSizeAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)]
        let secondaryFontSizeAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)]
        let mainColorAttribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
        let secondaryColorAttribute = [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]
        
        attributedText.addAttributes(mainFontSizeAttribute, range: NSRange(location: 0, length: title.count))
        attributedText.addAttributes(secondaryFontSizeAttribute, range: NSRange(location: title.count, length: subTitle.count))
        attributedText.addAttributes(secondaryColorAttribute, range: NSRange(location: title.count, length: subTitle.count))
        attributedText.addAttributes(mainColorAttribute, range: NSRange(location: 0, length: title.count))
        
        label.attributedText = attributedText
        label.isHidden = false
        return label
        
    }()
    
    private let backgroundLabelView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondarySystemBackground
        view.isHidden = false
        return view
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(detectionImageView)
        addSubview(backgroundLabelView)
        addSubview(placeholderLabel)
        
        heightConstraint = detectionImageView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Configure constraints
        NSLayoutConstraint.activate([
            detectionImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            detectionImageView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            detectionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            detectionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            placeholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeholderLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeholderLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            
            backgroundLabelView.topAnchor.constraint(equalTo: placeholderLabel.topAnchor, constant: -10),
            backgroundLabelView.bottomAnchor.constraint(equalTo: placeholderLabel.bottomAnchor, constant: 10),
            backgroundLabelView.leadingAnchor.constraint(equalTo: placeholderLabel.leadingAnchor, constant: -10),
            backgroundLabelView.trailingAnchor.constraint(equalTo: placeholderLabel.trailingAnchor, constant: 10),
        ])
    }
    
    // MARK: - Public Actions
    func configure(image: UIImage?, nilAnimation: Bool = false) {
        if nilAnimation { detectionImageView.image = nil }
        
        guard let image else {
            detectionImageView.isHidden = true
            placeholderLabel.isHidden = false
            backgroundLabelView.isHidden = false
            return
        }
        
        let height = self.bounds.size.height - 20
        let width = self.bounds.size.width - 20
        let imageViewHeight = min(height, image.size.height * width / image.size.width)
        
        heightConstraint.isActive = false
        heightConstraint.constant = imageViewHeight
        heightConstraint.isActive = true
        
        detectionImageView.isHidden = false
        placeholderLabel.isHidden = true
        backgroundLabelView.isHidden = true
        
        UIView.animate(withDuration: 0.4) {
            self.layoutIfNeeded()
        } completion: {_ in
            self.detectionImageView.image = image
        }
    }
    
    // MARK: - Private Actions
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: DetectionView.self))") }
}
