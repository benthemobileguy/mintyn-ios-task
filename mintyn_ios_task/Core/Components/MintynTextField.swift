//
//  MintynTextField.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class MintynTextField: UIView {
    private let titleLabel = UILabel()
    private let textField = UITextField()
    private let eyeButton = UIButton(type: .custom)
    private let countryFlagButton = UIButton(type: .custom)
    private let countryCodeLabel = UILabel()
    private let textFieldContainer = UIView()
    
    var text: String? {
        get { return textField.text }
        set { textField.text = newValue }
    }
    
    var placeholder: String? {
        get { return textField.placeholder }
        set { textField.placeholder = newValue }
    }
    
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var isSecure: Bool = false {
        didSet {
            textField.isSecureTextEntry = isSecure
            eyeButton.isHidden = !isSecure
        }
    }
    
    var isPhoneField: Bool = false {
        didSet {
            countryFlagButton.isHidden = !isPhoneField
            countryCodeLabel.isHidden = !isPhoneField
            
            // Adjust textField leading constraint when phone field is set
            if let constraint = textFieldLeadingConstraint {
                textField.removeConstraint(constraint)
            }
            
            if isPhoneField {
                textFieldLeadingConstraint = textField.leadingAnchor.constraint(equalTo: countryCodeLabel.trailingAnchor, constant: 4)
            } else {
                textFieldLeadingConstraint = textField.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor, constant: 16)
            }
            
            textFieldLeadingConstraint?.isActive = true
        }
    }
    
    private var textFieldLeadingConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        // Title Label
        titleLabel.font = Constants.Fonts.medium(size: 14)
        titleLabel.textColor = Constants.Colors.textPrimary
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // TextField Container
        textFieldContainer.layer.cornerRadius = 8
        textFieldContainer.layer.borderWidth = 1
        textFieldContainer.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        textFieldContainer.backgroundColor = .white
        addSubview(textFieldContainer)
        textFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        
        // Country Flag Button (for phone field)
        countryFlagButton.setTitle("🇳🇬", for: .normal)
        countryFlagButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        countryFlagButton.contentHorizontalAlignment = .center
        textFieldContainer.addSubview(countryFlagButton)
        countryFlagButton.translatesAutoresizingMaskIntoConstraints = false
        countryFlagButton.isHidden = true
        
        // Country Code Label (for phone field)
        countryCodeLabel.text = "+"
        countryCodeLabel.font = Constants.Fonts.regular(size: 16)
        countryCodeLabel.textColor = Constants.Colors.textPrimary
        textFieldContainer.addSubview(countryCodeLabel)
        countryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCodeLabel.isHidden = true
        
        // Text Field
        textField.font = Constants.Fonts.regular(size: 16)
        textField.textColor = Constants.Colors.textPrimary
        textField.clearButtonMode = .whileEditing
        textFieldContainer.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Eye Button (for password field)
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButton.tintColor = .lightGray
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textFieldContainer.addSubview(eyeButton)
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.isHidden = true
        
        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textFieldContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textFieldContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            textFieldContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            textFieldContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            textFieldContainer.heightAnchor.constraint(equalToConstant: 54),
            
            countryFlagButton.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor, constant: 12),
            countryFlagButton.centerYAnchor.constraint(equalTo: textFieldContainer.centerYAnchor),
            countryFlagButton.widthAnchor.constraint(equalToConstant: 30),
            
            countryCodeLabel.leadingAnchor.constraint(equalTo: countryFlagButton.trailingAnchor, constant: 4),
            countryCodeLabel.centerYAnchor.constraint(equalTo: textFieldContainer.centerYAnchor),
            
            eyeButton.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor, constant: -12),
            eyeButton.centerYAnchor.constraint(equalTo: textFieldContainer.centerYAnchor),
            eyeButton.widthAnchor.constraint(equalToConstant: 24),
            eyeButton.heightAnchor.constraint(equalToConstant: 24),
            
            textField.centerYAnchor.constraint(equalTo: textFieldContainer.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: eyeButton.leadingAnchor, constant: -8)
        ])
        
        // Set default leading constraint for textField
        textFieldLeadingConstraint = textField.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor, constant: 16)
        textFieldLeadingConstraint?.isActive = true
    }
    
    @objc private func togglePasswordVisibility() {
        textField.isSecureTextEntry.toggle()
        let imageName = textField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

