//
//  HomeViewModel.swift
//  mintyn_ios_task
//
//  Created by apple on 12/03/2025.
//

import Foundation
import UIKit

class HomeViewModel {
    var featuredItems: [BankingFeatureModel] = []
    var quickAccessItems: [BankingFeatureModel] = []
    var recentTransactions: [TransactionModel] = []
    
    private let userDefaultsManager = UserDefaultsManager.shared
    
    init() {
        setupMockData()
    }
    
    func setupMockData() {
        // Featured Items
        featuredItems = [
            BankingFeatureModel(
                title: "Send Money",
                icon: UIImage(systemName: "arrow.up.right"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            ),
            BankingFeatureModel(
                title: "Request Money",
                icon: UIImage(systemName: "arrow.down.left"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            ),
            BankingFeatureModel(
                title: "Pay Bills",
                icon: UIImage(systemName: "doc.text"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            ),
            BankingFeatureModel(
                title: "Budget",
                icon: UIImage(systemName: "chart.pie"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            )
        ]
        
        // Quick Access Items
        quickAccessItems = [
            BankingFeatureModel(
                title: "Account Balance",
                icon: UIImage(systemName: "creditcard"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            ),
            BankingFeatureModel(
                title: "Savings",
                icon: UIImage(systemName: "banknote"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            ),
            BankingFeatureModel(
                title: "Cards",
                icon: UIImage(systemName: "creditcard.fill"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            ),
            BankingFeatureModel(
                title: "Loans",
                icon: UIImage(systemName: "dollarsign.circle"),
                iconTintColor: Constants.Colors.primaryGold,
                actionHandler: nil
            )
        ]
        
        // Recent Transactions
        recentTransactions = [
            TransactionModel(
                title: "Grocery Shopping",
                date: Date().addingTimeInterval(-86400), // yesterday
                amount: -15000.0,
                category: .shopping
            ),
            TransactionModel(
                title: "Salary Deposit",
                date: Date().addingTimeInterval(-345600), // 4 days ago
                amount: 250000.0,
                category: .income
            ),
            TransactionModel(
                title: "Netflix Subscription",
                date: Date().addingTimeInterval(-518400), // 6 days ago
                amount: -4500.0,
                category: .entertainment
            ),
            TransactionModel(
                title: "Savings Transfer",
                date: Date().addingTimeInterval(-604800), // 1 week ago
                amount: -50000.0,
                category: .transfer
            )
        ]
    }
    
    var userName: String {
        return "John"
    }
    
    var formattedPhoneNumber: String {
        if let phone = userDefaultsManager.phoneNumber {
            return phone
        }
        return "N/A"
    }
}

