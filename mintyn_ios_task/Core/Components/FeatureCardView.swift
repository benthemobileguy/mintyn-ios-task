//
//  FeatureCardView.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class FeatureCardView: UIView {
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var subtitle: String? {
        get { return subtitleLabel.text }
        set {
            subtitleLabel.text = newValue
            subtitleLabel.isHidden = newValue == nil || newValue?.isEmpty == true
        }
    }
    
    var iconImage: UIImage? {
        get { return iconImageView.image }
        set { iconImageView.image = newValue }
    }
    
    var iconTintColor: UIColor? {
        get { return iconImageView.tintColor }
        set { iconImageView.tintColor = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 12
        addShadow(opacity: 0.05, radius: 4, offset: CGSize(width: 0, height: 2))
        
        // Icon Setup
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = Constants.Colors.primaryGold
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Title Setup
        titleLabel.font = Constants.Fonts.medium(size: 16)
        titleLabel.textColor = Constants.Colors.textPrimary
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Subtitle Setup
        subtitleLabel.font = Constants.Fonts.regular(size: 14)
        subtitleLabel.textColor = Constants.Colors.textSecondary
        subtitleLabel.isHidden = true
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ])
    }
}

