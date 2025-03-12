//
//  Untitled.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    private let containerView = UIView()
    private let iconContainer = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let amountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
        
        // Container
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        // Icon Container
        iconContainer.backgroundColor = .lightGray.withAlphaComponent(0.2)
        iconContainer.layer.cornerRadius = 20
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(iconContainer)
        
        // Icon
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .darkGray
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.addSubview(iconView)
        
        // Title
        titleLabel.font = Constants.Fonts.medium(size: 16)
        titleLabel.textColor = Constants.Colors.textPrimary
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        // Date
        dateLabel.font = Constants.Fonts.regular(size: 14)
        dateLabel.textColor = Constants.Colors.textSecondary
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dateLabel)
        
        // Amount
        amountLabel.font = Constants.Fonts.semibold(size: 16)
        amountLabel.textAlignment = .right
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(amountLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            iconContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            iconContainer.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 40),
            iconContainer.heightAnchor.constraint(equalToConstant: 40),
            
            iconView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: -12),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 12),
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            
            amountLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            amountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
    
    func configure(with transaction: TransactionModel) {
        titleLabel.text = transaction.title
        dateLabel.text = transaction.formattedDate
        
        // Set amount color based on expense/income
        if transaction.isExpense {
            amountLabel.text = "-\(transaction.formattedAmount)"
            amountLabel.textColor = .systemRed
        } else {
            amountLabel.text = "+\(transaction.formattedAmount)"
            amountLabel.textColor = .systemGreen
        }
        
        // Set category icon
        iconView.image = UIImage(systemName: transaction.category.icon)
        iconContainer.backgroundColor = transaction.category.color.withAlphaComponent(0.2)
        iconView.tintColor = transaction.category.color
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        dateLabel.text = nil
        amountLabel.text = nil
        iconView.image = nil
    }
}

