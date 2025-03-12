//
//  HomeViewController.swift
//  mintyn_ios_task
//
//  Created by apple on 12/03/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let balanceCardView = UIView()
    private let featuredCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let quickAccessCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let transactionsTableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigationBar()
        setupCollectionViews()
        setupTableView()
    }
    
    private func setupViews() {
        view.backgroundColor = Constants.Colors.background
        
        // Scroll View
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // Setup Balance Card
        setupBalanceCard()
        
        // Featured Section
        let featuredLabel = createSectionHeader(title: "Quick Actions")
        
        // Collection View for Featured Items
        featuredCollectionView.translatesAutoresizingMaskIntoConstraints = false
        featuredCollectionView.backgroundColor = .clear
        featuredCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(featuredCollectionView)
        
        // Quick Access Section
        let quickAccessLabel = createSectionHeader(title: "Your Accounts")
        
        // Collection View for Quick Access
        quickAccessCollectionView.translatesAutoresizingMaskIntoConstraints = false
        quickAccessCollectionView.backgroundColor = .clear
        quickAccessCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(quickAccessCollectionView)
        
        // Recent Transactions Section
        let transactionsLabel = createSectionHeader(title: "Recent Transactions")
        
        // Table View for Transactions
        transactionsTableView.translatesAutoresizingMaskIntoConstraints = false
        transactionsTableView.backgroundColor = .clear
        transactionsTableView.isScrollEnabled = false
        transactionsTableView.separatorStyle = .none
        contentView.addSubview(transactionsTableView)
        
        // Add all section headers to contentView
        contentView.addSubview(featuredLabel)
        contentView.addSubview(quickAccessLabel)
        contentView.addSubview(transactionsLabel)
        
        // Constraints
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
            
            balanceCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            balanceCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            balanceCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            balanceCardView.heightAnchor.constraint(equalToConstant: 180),
            
            featuredLabel.topAnchor.constraint(equalTo: balanceCardView.bottomAnchor, constant: 24),
            featuredLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            featuredLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            featuredCollectionView.topAnchor.constraint(equalTo: featuredLabel.bottomAnchor, constant: 16),
            featuredCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            featuredCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            featuredCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            quickAccessLabel.topAnchor.constraint(equalTo: featuredCollectionView.bottomAnchor, constant: 24),
            quickAccessLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            quickAccessLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            quickAccessCollectionView.topAnchor.constraint(equalTo: quickAccessLabel.bottomAnchor, constant: 16),
            quickAccessCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            quickAccessCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            quickAccessCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            transactionsLabel.topAnchor.constraint(equalTo: quickAccessCollectionView.bottomAnchor, constant: 24),
            transactionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            transactionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            transactionsTableView.topAnchor.constraint(equalTo: transactionsLabel.bottomAnchor, constant: 16),
            transactionsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            transactionsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            transactionsTableView.heightAnchor.constraint(equalToConstant: CGFloat(viewModel.recentTransactions.count * 70)),
            transactionsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
    
    private func setupNavigationBar() {
        // Create a custom title view
        let titleView = UIView()
        
        let titleLabel = UILabel()
        titleLabel.text = "Home"
        titleLabel.font = Constants.Fonts.bold(size: 18)
        titleLabel.textColor = .black
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Welcome back, \(viewModel.userName)"
        subtitleLabel.font = Constants.Fonts.regular(size: 14)
        subtitleLabel.textColor = Constants.Colors.textSecondary
        
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor)
        ])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
        
        // Add notification button
        let notificationButton = UIButton(type: .system)
        notificationButton.setImage(UIImage(systemName: "bell"), for: .normal)
        notificationButton.tintColor = .black
        notificationButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }
    
    private func setupBalanceCard() {
        balanceCardView.backgroundColor = Constants.Colors.primaryGold
        balanceCardView.layer.cornerRadius = 16
        balanceCardView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(balanceCardView)
        
        // Balance title label
        let balanceTitleLabel = UILabel()
        balanceTitleLabel.text = "Account Balance"
        balanceTitleLabel.font = Constants.Fonts.medium(size: 16)
        balanceTitleLabel.textColor = .white.withAlphaComponent(0.8)
        balanceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceCardView.addSubview(balanceTitleLabel)
        
        // Balance amount label
        let balanceAmountLabel = UILabel()
        balanceAmountLabel.text = "₦1,250,000.00"
        balanceAmountLabel.font = Constants.Fonts.bold(size: 32)
        balanceAmountLabel.textColor = .white
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceCardView.addSubview(balanceAmountLabel)
        
        // Account number label
        let accountNumberLabel = UILabel()
        accountNumberLabel.text = "Account Number: 1234567890"
        accountNumberLabel.font = Constants.Fonts.regular(size: 14)
        accountNumberLabel.textColor = .white.withAlphaComponent(0.8)
        accountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceCardView.addSubview(accountNumberLabel)
        
        // Add eye icon button to toggle balance visibility
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButton.tintColor = .white
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.addTarget(self, action: #selector(toggleBalanceVisibility), for: .touchUpInside)
        balanceCardView.addSubview(eyeButton)
        
        // Add a bottom container for buttons
        let bottomContainer = UIView()
        bottomContainer.backgroundColor = .white.withAlphaComponent(0.2)
        bottomContainer.layer.cornerRadius = 8
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        balanceCardView.addSubview(bottomContainer)
        
        // Add buttons for quick actions
        let sendButton = createQuickActionButton(title: "Send", icon: "arrow.up")
        let receiveButton = createQuickActionButton(title: "Receive", icon: "arrow.down")
        let qrButton = createQuickActionButton(title: "QR Code", icon: "qrcode")
        
        // Add tap gestures to quick action buttons
        let sendTap = UITapGestureRecognizer(target: self, action: #selector(sendMoneyTapped))
        let receiveTap = UITapGestureRecognizer(target: self, action: #selector(receiveMoneyTapped))
        let qrTap = UITapGestureRecognizer(target: self, action: #selector(qrCodeTapped))
        
        sendButton.addGestureRecognizer(sendTap)
        receiveButton.addGestureRecognizer(receiveTap)
        qrButton.addGestureRecognizer(qrTap)
        
        sendButton.isUserInteractionEnabled = true
        receiveButton.isUserInteractionEnabled = true
        qrButton.isUserInteractionEnabled = true
        
        bottomContainer.addSubview(sendButton)
        bottomContainer.addSubview(receiveButton)
        bottomContainer.addSubview(qrButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            balanceTitleLabel.topAnchor.constraint(equalTo: balanceCardView.topAnchor, constant: 16),
            balanceTitleLabel.leadingAnchor.constraint(equalTo: balanceCardView.leadingAnchor, constant: 16),
            
            eyeButton.centerYAnchor.constraint(equalTo: balanceTitleLabel.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: balanceCardView.trailingAnchor, constant: -16),
            eyeButton.widthAnchor.constraint(equalToConstant: 24),
            eyeButton.heightAnchor.constraint(equalToConstant: 24),
            
            balanceAmountLabel.topAnchor.constraint(equalTo: balanceTitleLabel.bottomAnchor, constant: 8),
            balanceAmountLabel.leadingAnchor.constraint(equalTo: balanceCardView.leadingAnchor, constant: 16),
            balanceAmountLabel.trailingAnchor.constraint(equalTo: balanceCardView.trailingAnchor, constant: -16),
            
            accountNumberLabel.topAnchor.constraint(equalTo: balanceAmountLabel.bottomAnchor, constant: 8),
            accountNumberLabel.leadingAnchor.constraint(equalTo: balanceCardView.leadingAnchor, constant: 16),
            accountNumberLabel.trailingAnchor.constraint(equalTo: balanceCardView.trailingAnchor, constant: -16),
            
            bottomContainer.leadingAnchor.constraint(equalTo: balanceCardView.leadingAnchor, constant: 16),
            bottomContainer.trailingAnchor.constraint(equalTo: balanceCardView.trailingAnchor, constant: -16),
            bottomContainer.bottomAnchor.constraint(equalTo: balanceCardView.bottomAnchor, constant: -16),
            bottomContainer.heightAnchor.constraint(equalToConstant: 50),
            
            sendButton.topAnchor.constraint(equalTo: bottomContainer.topAnchor),
            sendButton.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor),
            sendButton.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor),
            sendButton.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.33),
            
            receiveButton.topAnchor.constraint(equalTo: bottomContainer.topAnchor),
            receiveButton.leadingAnchor.constraint(equalTo: sendButton.trailingAnchor),
            receiveButton.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor),
            receiveButton.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.33),
            
            qrButton.topAnchor.constraint(equalTo: bottomContainer.topAnchor),
            qrButton.leadingAnchor.constraint(equalTo: receiveButton.trailingAnchor),
            qrButton.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor),
            qrButton.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor)
        ])
    }
    
    @objc private func toggleBalanceVisibility(_ sender: UIButton) {
        // Toggle between showing and hiding the balance
        if let balanceLabel = balanceCardView.subviews.compactMap({ $0 as? UILabel }).first(where: { $0.font == Constants.Fonts.bold(size: 32) }) {
            let isHidden = balanceLabel.text?.contains("*") ?? false
            
            if isHidden {
                balanceLabel.text = "₦1,250,000.00"
                sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            } else {
                balanceLabel.text = "₦*****"
                sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            }
        }
    }
    
    @objc private func sendMoneyTapped() {
        // This would navigate to send money screen in a real app
        showFeatureAlert(title: "Send Money")
    }
    
    @objc private func receiveMoneyTapped() {
        // This would navigate to receive money screen in a real app
        showFeatureAlert(title: "Receive Money")
    }
    
    @objc private func qrCodeTapped() {
        // This would navigate to QR code screen in a real app
        showFeatureAlert(title: "QR Code")
    }
    
    private func showFeatureAlert(title: String) {
        let alert = UIAlertController(
            title: title,
            message: "This feature would be implemented in the full version of the app.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func createQuickActionButton(title: String, icon: String) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(systemName: icon))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = title
        label.font = Constants.Fonts.medium(size: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(imageView)
        container.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8)
        ])
        
        return container
    }
    
    private func createSectionHeader(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = Constants.Fonts.semibold(size: 18)
        label.textColor = Constants.Colors.textPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func setupCollectionViews() {
        // Register cell classes
        featuredCollectionView.register(FeatureCell.self, forCellWithReuseIdentifier: "FeatureCell")
        quickAccessCollectionView.register(FeatureCell.self, forCellWithReuseIdentifier: "FeatureCell")
        
        // Set delegates and data sources
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        quickAccessCollectionView.delegate = self
        quickAccessCollectionView.dataSource = self
        
        // Set content insets
        featuredCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        quickAccessCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    }
    
    private func setupTableView() {
        transactionsTableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionCell")
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        transactionsTableView.rowHeight = 70
    }
}

// MARK: - Collection View Delegate & Data Source
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredCollectionView {
            return viewModel.featuredItems.count
        } else {
            return viewModel.quickAccessItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as? FeatureCell else {
            return UICollectionViewCell()
        }
        
        let item: BankingFeatureModel
        if collectionView == featuredCollectionView {
            item = viewModel.featuredItems[indexPath.item]
        } else {
            item = viewModel.quickAccessItems[indexPath.item]
        }
        
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == featuredCollectionView {
            // Handle feature item selection
            let featureTitle = viewModel.featuredItems[indexPath.item].title
            showFeatureAlert(title: featureTitle)
        } else {
            // Handle quick access item selection
            let featureTitle = viewModel.quickAccessItems[indexPath.item].title
            showFeatureAlert(title: featureTitle)
        }
    }
}

// MARK: - Table View Delegate & Data Source
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recentTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        
        let transaction = viewModel.recentTransactions[indexPath.row]
        cell.configure(with: transaction)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Show transaction details
        let transaction = viewModel.recentTransactions[indexPath.row]
        let alert = UIAlertController(
            title: "Transaction Details",
            message: "Amount: \(transaction.isExpense ? "-" : "+")\(transaction.formattedAmount)\nDate: \(transaction.formattedDate)\nCategory: \(transaction.category)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        present(alert, animated: true)
    }
}

