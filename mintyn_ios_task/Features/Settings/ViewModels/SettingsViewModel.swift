//
//  SettingsViewModel.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class SettingsViewModel {
    var sections: [SettingsSection] = []
    
    private let authViewModel = AuthViewModel()
    
    init() {
        setupSections()
    }
    
    private func setupSections() {
        // Account section
        let accountSection = SettingsSection(
            title: "Account",
            items: [
                SettingsItem(
                    title: "Profile",
                    icon: UIImage(systemName: "person.fill"),
                    iconTintColor: .systemBlue,
                    actionType: .other(action: {})
                ),
                SettingsItem(
                    title: "Security",
                    icon: UIImage(systemName: "lock.fill"),
                    iconTintColor: .systemGreen,
                    actionType: .security
                ),
                SettingsItem(
                    title: "Notifications",
                    icon: UIImage(systemName: "bell.fill"),
                    iconTintColor: .systemOrange,
                    actionType: .notifications
                )
            ]
        )
        
        // Preferences section
        let preferencesSection = SettingsSection(
            title: "Preferences",
            items: [
                SettingsItem(
                    title: "System",
                    icon: UIImage(systemName: "gear"),
                    iconTintColor: .systemGray,
                    actionType: .system
                ),
                SettingsItem(
                    title: "Appearance",
                    icon: UIImage(systemName: "paintbrush.fill"),
                    iconTintColor: .systemPurple,
                    actionType: .preferences
                ),
                SettingsItem(
                    title: "Language",
                    icon: UIImage(systemName: "globe"),
                    iconTintColor: .systemTeal,
                    actionType: .preferences
                )
            ]
        )
        
        // Support section
        let supportSection = SettingsSection(
            title: "Support",
            items: [
                SettingsItem(
                    title: "Help Center",
                    icon: UIImage(systemName: "questionmark.circle.fill"),
                    iconTintColor: .systemBlue,
                    actionType: .support
                ),
                SettingsItem(
                    title: "Contact Us",
                    icon: UIImage(systemName: "envelope.fill"),
                    iconTintColor: .systemIndigo,
                    actionType: .support
                ),
                SettingsItem(
                    title: "Legal",
                    icon: UIImage(systemName: "doc.text.fill"),
                    iconTintColor: .systemGray,
                    actionType: .legal
                )
            ]
        )
        
        // Logout section
        let logoutSection = SettingsSection(
            title: "",
            items: [
                SettingsItem(
                    title: "Logout",
                    icon: UIImage(systemName: "arrow.right.square.fill"),
                    iconTintColor: .systemRed,
                    actionType: .logout
                )
            ]
        )
        
        sections = [accountSection, preferencesSection, supportSection, logoutSection]
    }
    
    func performLogout(completion: @escaping (Bool) -> Void) {
        authViewModel.logout(completion: completion)
    }
}

