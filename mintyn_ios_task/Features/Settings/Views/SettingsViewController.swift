//
//  SettingsViewController.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let viewModel = SettingsViewModel()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
    }
    
    private func setupViews() {
        title = "Settings"
        view.backgroundColor = Constants.Colors.background
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        tableView.backgroundColor = Constants.Colors.background
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        
        // Remove extra separators
        tableView.tableFooterView = UIView()
    }
    
    private func handleSettingsAction(_ actionType: SettingsActionType) {
        switch actionType {
        case .system:
            let systemVC = SystemSettingsViewController()
            navigationController?.pushViewController(systemVC, animated: true)
            
        case .legal:
            let legalVC = LegalViewController()
            navigationController?.pushViewController(legalVC, animated: true)
            
        case .logout:
            showLogoutConfirmation()
            
        case .other(let action):
            action()
            
        default:
            // For other actions, we would implement similar navigation
            let placeholderVC = UIViewController()
            placeholderVC.view.backgroundColor = .white
            placeholderVC.title = "Feature Coming Soon"
            navigationController?.pushViewController(placeholderVC, animated: true)
        }
    }
    
    private func showLogoutConfirmation() {
        let alert = UIAlertController(
            title: "Logout",
            message: "Are you sure you want to logout?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive) { [weak self] _ in
            self?.performLogout()
        })
        
        present(alert, animated: true)
    }
    
    private func performLogout() {
        viewModel.performLogout { [weak self] success in
            guard success, let self = self else { return }
            
            DispatchQueue.main.async {
                // Navigate back to login screen
                let welcomeVC = WelcomeViewController()
                let navigationController = UINavigationController(rootViewController: welcomeVC)
                navigationController.isNavigationBarHidden = true
                
                UIApplication.shared.windows.first?.rootViewController = navigationController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell else {
            return UITableViewCell()
        }
        
        let item = viewModel.sections[indexPath.section].items[indexPath.row]
        cell.configure(with: item)
        
        // Special styling for logout cell
        if case .logout = item.actionType {
            cell.setLogoutStyle()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle = viewModel.sections[section].title
        return sectionTitle.isEmpty ? nil : sectionTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = viewModel.sections[indexPath.section].items[indexPath.row]
        handleSettingsAction(item.actionType)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard !viewModel.sections[section].title.isEmpty else {
            // Return empty view with minimal height for sections without titles
            let emptyView = UIView()
            emptyView.backgroundColor = .clear
            return emptyView
        }
        
        let headerView = UIView()
        headerView.backgroundColor = Constants.Colors.background
        
        let titleLabel = UILabel()
        titleLabel.text = viewModel.sections[section].title
        titleLabel.font = Constants.Fonts.semibold(size: 16)
        titleLabel.textColor = Constants.Colors.textSecondary
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.sections[section].title.isEmpty ? 20 : 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
}

