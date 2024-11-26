//
//  Untitled.swift
//  Detection
//
//  Created by e1ernal on 20.11.2024.
//

import UIKit

final class RecognizableObjectView: UIView {
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let imageHeight: CGFloat = 80
    private let imageWidth: CGFloat = 80
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = .spacing
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = .spacing
        return stack
    }()
    
    private let signImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .title
        label.textColor = .label
        label.textAlignment = .center
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
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .secondaryLabel
        return button
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure View
        addSubview(backgroundView)
        addSubview(stackView)
        addSubview(closeButton)
        
        backgroundColor = .systemBackground.withAlphaComponent(0.9)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
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
            signImageView.heightAnchor.constraint(equalToConstant: imageHeight)
        ])
        
        stackView.addArrangedSubview(signImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 2 * .spacing),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -2 * .spacing),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 2 * .spacing),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -2 * .spacing),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -.spacing),
            backgroundView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: .spacing),
            backgroundView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -.spacing),
            backgroundView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: .spacing),
            
            closeButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 2 * .spacing),
            closeButton.heightAnchor.constraint(equalToConstant: 2 * .spacing)
        ])
    }
    
    // MARK: - Public Actions
    func configure(title: String, subtitle: String, image: String) {
        signImageView.image = UIImage(named: image)
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    // MARK: - Private Actions
    @objc func closeButtonTapped() {
        hideView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        guard touch?.view != backgroundView else { return }
        guard touch?.view != stackView else { return }
        
        hideView()
    }
    
    private func hideView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { _ in
            self.isHidden = true
        }
    }
    
    // MARK: - Deinitialization
    deinit { print("Deinit \(String(describing: RecognizableObjectView.self))") }
}
