//
//  LoginViewController.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class LoginViewController: UIViewController {
    private let viewModel = AuthViewModel()
    
    private let welcomeLabel = UILabel()
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let firstPageContainer = UIView()
    private let secondPageContainer = UIView()
    
    private let phoneNumberLabel = UILabel()
    private let phoneNumberField = UITextField()
    private let phoneNumberContainer = UIView()
    private let flagImageView = UIImageView()
    private let countryCodeLabel = UILabel()
    
    private let passwordLabel = UILabel()
    private let passwordField = UITextField()
    private let passwordContainer = UIView()
    private let eyeButton = UIButton(type: .system)
    
    private let rememberMeCheckbox = UIButton(type: .system)
    private let rememberMeLabel = UILabel()
    private let forgotPasswordButton = UIButton(type: .system)
    
    private let loginButton = UIButton(type: .system)
    private let registerDeviceLabel = UILabel()
    private let poweredByLabel = UILabel()
    private let versionLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        
        
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        // Scroll View for Feature Cards
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // First Page Container
        firstPageContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(firstPageContainer)
        
        // Second Page Container
        secondPageContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(secondPageContainer)
        
        
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPageIndicatorTintColor = Constants.Colors.primaryGold
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        // Phone Number Section
        setupPhoneNumberField()
        
        // Password Section
        setupPasswordField()
        
        // Remember Me Section
        setupRememberMeSection()
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = Constants.Colors.primaryGold
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        loginButton.layer.cornerRadius = 16
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        
        registerDeviceLabel.text = "Register new device"
        registerDeviceLabel.font = UIFont.systemFont(ofSize: 14)
        registerDeviceLabel.textColor = Constants.Colors.primaryGold
        registerDeviceLabel.textAlignment = .center
        registerDeviceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerDeviceLabel)
        
        
        poweredByLabel.text = "Powered by FINEX MFB"
        poweredByLabel.font = UIFont.systemFont(ofSize: 12)
        poweredByLabel.textColor = .gray
        poweredByLabel.textAlignment = .center
        poweredByLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(poweredByLabel)
        
        
        versionLabel.text = "Version 1.3.94"
        versionLabel.font = Constants.Fonts.semibold(size: 12)
        versionLabel.textColor = .gray
        versionLabel.textAlignment = .center
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(versionLabel)
        
        
        NSLayoutConstraint.activate([
            versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            versionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
        
        
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 220),
            
            firstPageContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            firstPageContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            firstPageContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            firstPageContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            firstPageContainer.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            secondPageContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            secondPageContainer.leadingAnchor.constraint(equalTo: firstPageContainer.trailingAnchor),
            secondPageContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            secondPageContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            secondPageContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            secondPageContainer.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 24),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            phoneNumberContainer.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 8),
            phoneNumberContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            phoneNumberContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            phoneNumberContainer.heightAnchor.constraint(equalToConstant: 54),
            
            flagImageView.leadingAnchor.constraint(equalTo: phoneNumberContainer.leadingAnchor, constant: 16),
            flagImageView.centerYAnchor.constraint(equalTo: phoneNumberContainer.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 24),
            flagImageView.heightAnchor.constraint(equalToConstant: 16),
            
            countryCodeLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 8),
            countryCodeLabel.centerYAnchor.constraint(equalTo: phoneNumberContainer.centerYAnchor),
            
            phoneNumberField.leadingAnchor.constraint(equalTo: countryCodeLabel.trailingAnchor, constant: 4),
            phoneNumberField.trailingAnchor.constraint(equalTo: phoneNumberContainer.trailingAnchor, constant: -16),
            phoneNumberField.centerYAnchor.constraint(equalTo: phoneNumberContainer.centerYAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: phoneNumberContainer.bottomAnchor, constant: 24),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            passwordContainer.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordContainer.heightAnchor.constraint(equalToConstant: 54),
            
            passwordField.leadingAnchor.constraint(equalTo: passwordContainer.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: eyeButton.leadingAnchor, constant: -8),
            passwordField.centerYAnchor.constraint(equalTo: passwordContainer.centerYAnchor),
            
            eyeButton.trailingAnchor.constraint(equalTo: passwordContainer.trailingAnchor, constant: -16),
            eyeButton.centerYAnchor.constraint(equalTo: passwordContainer.centerYAnchor),
            eyeButton.widthAnchor.constraint(equalToConstant: 24),
            eyeButton.heightAnchor.constraint(equalToConstant: 24),
            
            rememberMeCheckbox.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 16),
            rememberMeCheckbox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            rememberMeCheckbox.widthAnchor.constraint(equalToConstant: 20),
            rememberMeCheckbox.heightAnchor.constraint(equalToConstant: 20),
            
            rememberMeLabel.centerYAnchor.constraint(equalTo: rememberMeCheckbox.centerYAnchor),
            rememberMeLabel.leadingAnchor.constraint(equalTo: rememberMeCheckbox.trailingAnchor, constant: 8),
            
            forgotPasswordButton.centerYAnchor.constraint(equalTo: rememberMeCheckbox.centerYAnchor),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            loginButton.topAnchor.constraint(equalTo: rememberMeCheckbox.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            
            registerDeviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerDeviceLabel.bottomAnchor.constraint(equalTo: poweredByLabel.topAnchor, constant: -8),
            
            poweredByLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            poweredByLabel.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -4),
            
            versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
        
        // Setup Feature Cards
        setupFirstPageCards()
        setupSecondPageCards()
    }
    
    private func setupPhoneNumberField() {
        // Phone Number Label
        phoneNumberLabel.text = "Phone Number"
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 14)
        phoneNumberLabel.textColor = .black
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneNumberLabel)
        
        // Phone Number Container
        phoneNumberContainer.backgroundColor = .white
        phoneNumberContainer.layer.cornerRadius = 16
        phoneNumberContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneNumberContainer)
        
        
        flagImageView.image = UIImage(named: "nigeria_flag") ?? UIImage(systemName: "flag")
        flagImageView.tintColor = .green
        flagImageView.contentMode = .scaleAspectFit
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberContainer.addSubview(flagImageView)
        
        // Country Code
        countryCodeLabel.text = "+"
        countryCodeLabel.font = UIFont.systemFont(ofSize: 16)
        countryCodeLabel.textColor = .black
        countryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberContainer.addSubview(countryCodeLabel)
        
        // Phone Number Field
        phoneNumberField.placeholder = "Enter your phone number"
        phoneNumberField.font = UIFont.systemFont(ofSize: 16)
        phoneNumberField.keyboardType = .phonePad
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberContainer.addSubview(phoneNumberField)
    }
    
    private func setupPasswordField() {
        // Password Label
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        passwordLabel.textColor = .black
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        // Password Container
        passwordContainer.backgroundColor = .white
        passwordContainer.layer.cornerRadius = 16
        passwordContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordContainer)
        
        // Password Field
        passwordField.placeholder = "Enter your password"
        passwordField.font = UIFont.systemFont(ofSize: 16)
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordContainer.addSubview(passwordField)
        
        // Eye Button
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .lightGray
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        passwordContainer.addSubview(eyeButton)
    }
    
    private func setupRememberMeSection() {
        // Remember Me Checkbox
        rememberMeCheckbox.setImage(UIImage(systemName: "square"), for: .normal)
        rememberMeCheckbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        rememberMeCheckbox.tintColor = .lightGray
        rememberMeCheckbox.addTarget(self, action: #selector(toggleRememberMe), for: .touchUpInside)
        rememberMeCheckbox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rememberMeCheckbox)
        
        // Remember Me Label
        rememberMeLabel.text = "Remember me"
        rememberMeLabel.font = UIFont.systemFont(ofSize: 14)
        rememberMeLabel.textColor = .lightGray
        rememberMeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rememberMeLabel)
        
        // Forgot Password Button
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(Constants.Colors.primaryGold, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPasswordButton)
    }
    
    private func setupFirstPageCards() {
        
        let easyCollectCard = createFeatureCard(
            icon: UIImage(systemName: "n.square.fill"),
            iconTintColor: Constants.Colors.primaryGold,
            iconBgColor: UIColor(white: 0.95, alpha: 1.0),
            title: "EasyCollect",
            textAlignment: .left
        )
        
        let openAccountCard = createFeatureCard(
            icon: UIImage(systemName: "shield.fill"),
            iconTintColor: Constants.Colors.primaryGold,
            iconBgColor: UIColor(white: 0.95, alpha: 1.0),
            title: "Open an Account",
            textAlignment: .left
        )
        
        let businessRegistrationCard = createFeatureCard(
            icon: UIImage(systemName: "doc.fill"),
            iconTintColor: Constants.Colors.primaryGold,
            iconBgColor: UIColor(white: 0.95, alpha: 1.0),
            title: "CAC Business Registration",
            textAlignment: .left
        )
        
        let supportCard = createFeatureCard(
            icon: UIImage(systemName: "person.fill"),
            iconTintColor: Constants.Colors.primaryGold,
            iconBgColor: UIColor(white: 0.95, alpha: 1.0),
            title: "Contact Support",
            textAlignment: .left
        )
        
        firstPageContainer.addSubview(easyCollectCard)
        firstPageContainer.addSubview(openAccountCard)
        firstPageContainer.addSubview(businessRegistrationCard)
        firstPageContainer.addSubview(supportCard)
        
        
        NSLayoutConstraint.activate([
            easyCollectCard.topAnchor.constraint(equalTo: firstPageContainer.topAnchor, constant: 16),
            easyCollectCard.leadingAnchor.constraint(equalTo: firstPageContainer.leadingAnchor, constant: 16),
            easyCollectCard.trailingAnchor.constraint(equalTo: firstPageContainer.centerXAnchor, constant: -8),
            easyCollectCard.heightAnchor.constraint(equalToConstant: 80),
            
            openAccountCard.topAnchor.constraint(equalTo: firstPageContainer.topAnchor, constant: 16),
            openAccountCard.leadingAnchor.constraint(equalTo: firstPageContainer.centerXAnchor, constant: 8),
            openAccountCard.trailingAnchor.constraint(equalTo: firstPageContainer.trailingAnchor, constant: -16),
            openAccountCard.heightAnchor.constraint(equalToConstant: 80),
            
            businessRegistrationCard.topAnchor.constraint(equalTo: easyCollectCard.bottomAnchor, constant: 16),
            businessRegistrationCard.leadingAnchor.constraint(equalTo: firstPageContainer.leadingAnchor, constant: 16),
            businessRegistrationCard.trailingAnchor.constraint(equalTo: firstPageContainer.centerXAnchor, constant: -8),
            businessRegistrationCard.heightAnchor.constraint(equalToConstant: 80),
            
            supportCard.topAnchor.constraint(equalTo: openAccountCard.bottomAnchor, constant: 16),
            supportCard.leadingAnchor.constraint(equalTo: firstPageContainer.centerXAnchor, constant: 8),
            supportCard.trailingAnchor.constraint(equalTo: firstPageContainer.trailingAnchor, constant: -16),
            supportCard.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupSecondPageCards() {
        
        let mapleradsCard = createFeatureCard(
            icon: UIImage(systemName: "m.square.fill"),
            iconTintColor: UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0),
            iconBgColor: UIColor(red: 0.8, green: 0.95, blue: 0.4, alpha: 1.0),
            title: "Maplerad",
            subtitle: "Virtual Cards",
            textAlignment: .left
        )
        
        let insuranceCard = createFeatureCard(
            icon: UIImage(systemName: "shield.fill"),
            iconTintColor: Constants.Colors.primaryGold,
            iconBgColor: UIColor(white: 0.95, alpha: 1.0),
            title: "Insurance",
            subtitle: "Coming soon...",
            textAlignment: .left
        )
        
        let nctoCard = createFeatureCard(
            icon: UIImage(systemName: "creditcard.fill"),
            iconTintColor: UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0),
            iconBgColor: UIColor(white: 0.95, alpha: 1.0),
            title: "NCTO Card Activation",
            textAlignment: .left
        )
        
        secondPageContainer.addSubview(mapleradsCard)
        secondPageContainer.addSubview(insuranceCard)
        secondPageContainer.addSubview(nctoCard)
        
        
        NSLayoutConstraint.activate([
            mapleradsCard.topAnchor.constraint(equalTo: secondPageContainer.topAnchor, constant: 16),
            mapleradsCard.leadingAnchor.constraint(equalTo: secondPageContainer.leadingAnchor, constant: 16),
            mapleradsCard.trailingAnchor.constraint(equalTo: secondPageContainer.centerXAnchor, constant: -8),
            mapleradsCard.heightAnchor.constraint(equalToConstant: 80),
            
            insuranceCard.topAnchor.constraint(equalTo: secondPageContainer.topAnchor, constant: 16),
            insuranceCard.leadingAnchor.constraint(equalTo: secondPageContainer.centerXAnchor, constant: 8),
            insuranceCard.trailingAnchor.constraint(equalTo: secondPageContainer.trailingAnchor, constant: -16),
            insuranceCard.heightAnchor.constraint(equalToConstant: 80),
            
            nctoCard.topAnchor.constraint(equalTo: mapleradsCard.bottomAnchor, constant: 16),
            nctoCard.leadingAnchor.constraint(equalTo: secondPageContainer.leadingAnchor, constant: 16),
            nctoCard.trailingAnchor.constraint(equalTo: secondPageContainer.centerXAnchor, constant: -8),
            nctoCard.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func createFeatureCard(icon: UIImage?, iconTintColor: UIColor, iconBgColor: UIColor, title: String, subtitle: String? = nil, textAlignment: NSTextAlignment = .center) -> UIView {
        
        let card = UIView()
        card.backgroundColor = .white
        card.layer.cornerRadius = 16
        card.translatesAutoresizingMaskIntoConstraints = false
        
        // Icon container
        let iconContainer = UIView()
        iconContainer.backgroundColor = iconBgColor
        iconContainer.layer.cornerRadius = 8
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(iconContainer)
        
        // Icon
        let iconImageView = UIImageView(image: icon)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = iconTintColor
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.addSubview(iconImageView)
        
        // Title
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.textAlignment = textAlignment
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(titleLabel)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            iconContainer.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            iconContainer.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 36),
            iconContainer.heightAnchor.constraint(equalToConstant: 36),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        if let subtitle = subtitle {
            let subtitleLabel = UILabel()
            subtitleLabel.text = subtitle
            subtitleLabel.font = UIFont.systemFont(ofSize: 12)
            subtitleLabel.textColor = .lightGray
            subtitleLabel.textAlignment = textAlignment
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            card.addSubview(subtitleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 12),
                titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
                titleLabel.bottomAnchor.constraint(equalTo: card.centerYAnchor, constant: -2),
                
                subtitleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 12),
                subtitleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
                subtitleLabel.topAnchor.constraint(equalTo: card.centerYAnchor, constant: 2)
            ])
        } else {
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 12),
                titleLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
                titleLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor)
            ])
        }
        
        return card
    }
    
    @objc private func togglePasswordVisibility() {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye.slash" : "eye"
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func toggleRememberMe() {
        rememberMeCheckbox.isSelected.toggle()
    }
    
    @objc private func loginTapped() {
        guard let phoneNumber = phoneNumberField.text, !phoneNumber.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            // Show alert for empty fields
            let alert = UIAlertController(
                title: "Input Error",
                message: "Please enter both phone number and password",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        // Show loading state
        loginButton.isEnabled = false
        loginButton.setTitle("Logging in...", for: .normal)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            // Reset button state
            self?.loginButton.isEnabled = true
            self?.loginButton.setTitle("Login", for: .normal)
            
            // Navigate to home screen
            let tabBarController = MainTabBarController()
            UIApplication.shared.windows.first?.rootViewController = tabBarController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
}

// MARK: - UIScrollViewDelegate
extension LoginViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        pageControl.currentPage = page
        
        
        for (index, view) in pageControl.subviews.enumerated() {
            
            if index == page {
                view.transform = CGAffineTransform(scaleX: 2.0, y: 1.0) 
            } else {
                view.transform = CGAffineTransform.identity
            }
        }
    }
}
