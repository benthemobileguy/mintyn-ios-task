//
//  WelcomeViewController.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let logoImageView = UIImageView()
    private let mintynLabel = UILabel()
    private let contentView = UIView()
    private let welcomeLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let loginButton = MintynButton(title: "Login")
    private let createAccountButton = MintynButton(title: "Create account", style: .secondary)
    private let versionLabel = UILabel()
    private let bottomIndicator = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        
        
        logoImageView.image = UIImage(named: "mintyn_logo") ?? UIImage(systemName: "building.columns")
        logoImageView.tintColor = Constants.Colors.primaryGold
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // MINTYN label below logo
        mintynLabel.text = "MINTYN"
        mintynLabel.font = Constants.Fonts.bold(size: 24)
        mintynLabel.textColor = .black // Changed from gold to dark color
        mintynLabel.textAlignment = .center
        mintynLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mintynLabel)
        
        // Content View
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 0
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.alpha = 0  // Start invisible for animation
        view.addSubview(contentView)
        
        // Welcome Label
        welcomeLabel.text = "Welcome to"
        welcomeLabel.font = UIFont(name: "TimesNewRoman-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .semibold) // Changed to serif font
        welcomeLabel.textColor = .black
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(welcomeLabel)
        
        // Bank Name Label
        subtitleLabel.text = "Mintyn Digital Bank"
        subtitleLabel.font = UIFont(name: "TimesNewRoman-Bold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .semibold) // Changed to serif font
        subtitleLabel.textColor = .black
        subtitleLabel.textAlignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)
        
        // Description Label
        descriptionLabel.text = "Get started with the bank that puts you in control."
        descriptionLabel.font = Constants.Fonts.regular(size: 16)
        descriptionLabel.textColor = UIColor.darkGray
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        // Login Button
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        contentView.addSubview(loginButton)
        
        // Create Account Button
        createAccountButton.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
        contentView.addSubview(createAccountButton)
        
        // Version Label
        versionLabel.text = "Mintyn Version 1.3.94"
        versionLabel.font = Constants.Fonts.semibold(size: 12)
        versionLabel.textColor = .darkGray
        versionLabel.textAlignment = .center
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(versionLabel)
        
        // Bottom Indicator
        bottomIndicator.backgroundColor = .black
        bottomIndicator.layer.cornerRadius = 2
        bottomIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomIndicator)
        
        NSLayoutConstraint.activate([
            // Logo - reduced size from 120x120 to 100x100
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // MINTYN label below logo
            mintynLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mintynLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16), // Increased spacing from 8 to 16
            
            // Content View
            contentView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Welcome Label
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            welcomeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Subtitle Label
            subtitleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Description Label
            descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            // Login Button
            loginButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 60),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            // Create Account Button
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            createAccountButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            createAccountButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            
            versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            versionLabel.bottomAnchor.constraint(equalTo: bottomIndicator.topAnchor, constant: -8),
            
            // Bottom Indicator
            bottomIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            bottomIndicator.widthAnchor.constraint(equalToConstant: 40),
            bottomIndicator.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        // Animate content view after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.animateBottomSheet()
        }
    }
    
    private func animateBottomSheet() {
        // Save original frame
        let originalFrame = self.contentView.frame
        self.contentView.frame = CGRect(
            x: originalFrame.origin.x,
            y: self.view.frame.height,
            width: originalFrame.width,
            height: originalFrame.height
        )
        self.contentView.alpha = 1
        
        // Animate back to original position
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.contentView.frame = originalFrame
        }
    }
    
    @objc private func loginTapped() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc private func createAccountTapped() {
        let createAccountVC = CreateAccountViewController()
        navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let maskPath = UIBezierPath(
            roundedRect: contentView.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 30, height: 30)  // Increased corner radius for more curve
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        contentView.layer.mask = maskLayer
    }
}

