//
//  LegalViewController.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class LegalViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        title = "Legal"
        view.backgroundColor = .white
        
        // Scroll View
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // Content View
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // Terms Card
        let termsCard = createCard(
            title: "Terms of Service",
            description: "View the terms and conditions for using Mintyn Digital Bank services.",
            buttonTitle: "View Terms"
        )
        
        // Privacy Card
        let privacyCard = createCard(
            title: "Privacy Policy",
            description: "Learn how we collect, use, and protect your personal information.",
            buttonTitle: "View Policy"
        )
        
        // Licenses Card
        let licensesCard = createCard(
            title: "Licenses",
            description: "Information about third-party software and licenses used in this app.",
            buttonTitle: "View Licenses"
        )
        
        // Copyright Information
        let copyrightLabel = UILabel()
        copyrightLabel.text = "© 2025 Mintyn Digital Bank. All rights reserved."
        copyrightLabel.font = Constants.Fonts.regular(size: 14)
        copyrightLabel.textColor = Constants.Colors.textSecondary
        copyrightLabel.textAlignment = .center
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(termsCard)
        contentView.addSubview(privacyCard)
        contentView.addSubview(licensesCard)
        contentView.addSubview(copyrightLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            termsCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            termsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            termsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            privacyCard.topAnchor.constraint(equalTo: termsCard.bottomAnchor, constant: 16),
            privacyCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            privacyCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            licensesCard.topAnchor.constraint(equalTo: privacyCard.bottomAnchor, constant: 16),
            licensesCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            licensesCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            copyrightLabel.topAnchor.constraint(equalTo: licensesCard.bottomAnchor, constant: 32),
            copyrightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            copyrightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            copyrightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
    
    private func createCard(title: String, description: String, buttonTitle: String) -> UIView {
        let cardView = UIView()
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = Constants.Fonts.semibold(size: 18)
        titleLabel.textColor = Constants.Colors.textPrimary
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Description Label
        let descriptionLabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.font = Constants.Fonts.regular(size: 14)
        descriptionLabel.textColor = Constants.Colors.textSecondary
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Button
        let button = UIButton(type: .system)
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = Constants.Fonts.medium(size: 16)
        button.setTitleColor(Constants.Colors.primaryGold, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cardButtonTapped(_:)), for: .touchUpInside)
        
        cardView.addSubview(titleLabel)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(button)
        
        NSLayoutConstraint.activate([
            cardView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
        
        return cardView
    }
    
    @objc private func cardButtonTapped(_ sender: UIButton) {
        // Get the title from the button's superview
        if let cardView = sender.superview,
           let titleLabel = cardView.subviews.compactMap({ $0 as? UILabel }).first {
            
            let title = titleLabel.text ?? "Legal Document"
            
            // In a real app, this would open the actual document
            // For the demo, just show an alert
            let alert = UIAlertController(
                title: title,
                message: "This would open the \(title) document in a real app.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}

