//
//  MainTabBarController.swift
//  mintyn_ios_task
//
//  Created by apple on 12/03/2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        customizeTabBar()
    }
    
    private func setupViewControllers() {
        let homeVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let cardsVC = UIViewController() // Placeholder
        cardsVC.view.backgroundColor = .white
        cardsVC.title = "Cards"
        let cardsNav = UINavigationController(rootViewController: cardsVC)
        cardsNav.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "creditcard"), tag: 1)
        
        let historyVC = UIViewController() // Placeholder
        historyVC.view.backgroundColor = .white
        historyVC.title = "History"
        let historyNav = UINavigationController(rootViewController: historyVC)
        historyNav.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), tag: 2)
        
        let settingsVC = SettingsViewController()
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 3)
        
        viewControllers = [homeNav, cardsNav, historyNav, settingsNav]
    }
    
    private func customizeTabBar() {
        // Appearance customization matching screenshots
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        // Item appearance - matching exact style in screenshots
        let itemAppearance = UITabBarItemAppearance()
        
        // Normal state
        itemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.font: Constants.Fonts.medium(size: 12),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
        
        // Selected state - gold color matching screenshots
        itemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.font: Constants.Fonts.medium(size: 12),
            NSAttributedString.Key.foregroundColor: Constants.Colors.primaryGold
        ]
        
        // Apply the appearance
        appearance.stackedLayoutAppearance = itemAppearance
        tabBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
        // Set the tint color to match the golden color in screenshots
        tabBar.tintColor = Constants.Colors.primaryGold
    }
}


