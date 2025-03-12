//
//  MockDataProvider.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import Foundation

class MockDataProvider {
    // MARK: - Transaction Data
    static func getRecentTransactions() -> [Transaction] {
        return [
            Transaction(id: "1", type: .credit, amount: 25000, description: "Salary Payment", date: Date().addingTimeInterval(-86400), status: .successful),
            Transaction(id: "2", type: .debit, amount: 3500, description: "Electricity Bill", date: Date().addingTimeInterval(-172800), status: .successful),
            Transaction(id: "3", type: .debit, amount: 12000, description: "Supermarket Purchase", date: Date().addingTimeInterval(-259200), status: .successful),
            Transaction(id: "4", type: .credit, amount: 5000, description: "Refund from Store", date: Date().addingTimeInterval(-345600), status: .successful),
            Transaction(id: "5", type: .debit, amount: 2000, description: "Internet Subscription", date: Date().addingTimeInterval(-432000), status: .pending)
        ]
    }
    
    // MARK: - Account Data
    static func getUserAccountDetails() -> AccountDetails {
        return AccountDetails(
            accountNumber: "1234567890",
            accountName: "John Doe",
            accountType: "Savings Account",
            balance: 153250.75,
            currency: "NGN"
        )
    }
    
    // MARK: - Card Data
    static func getUserCards() -> [Card] {
        return [
            Card(id: "1", cardType: "Visa", lastFourDigits: "4567", expiryDate: "09/28", isVirtual: false),
            Card(id: "2", cardType: "Mastercard", lastFourDigits: "8912", expiryDate: "11/27", isVirtual: true)
        ]
    }
    
    // MARK: - Notification Data
    static func getNotifications() -> [Notification] {
        return [
            Notification(id: "1", title: "Transaction Alert", message: "Your account has been credited with NGN 25,000", date: Date().addingTimeInterval(-86400), isRead: true),
            Notification(id: "2", title: "Security Alert", message: "A new device was used to log into your account", date: Date().addingTimeInterval(-172800), isRead: false),
            Notification(id: "3", title: "Promotion", message: "Enjoy 5% cashback on all transactions this weekend", date: Date().addingTimeInterval(-259200), isRead: false)
        ]
    }
    
    // MARK: - Beneficiary Data
    static func getBeneficiaries() -> [Beneficiary] {
        return [
            Beneficiary(id: "1", name: "Sarah Johnson", accountNumber: "2345678901", bankName: "Access Bank"),
            Beneficiary(id: "2", name: "Michael Smith", accountNumber: "3456789012", bankName: "GTBank"),
            Beneficiary(id: "3", name: "Alice Okonkwo", accountNumber: "4567890123", bankName: "Mintyn Bank")
        ]
    }
}

// MARK: - Model Structs

struct Transaction {
    enum TransactionType {
        case credit
        case debit
    }
    
    enum TransactionStatus {
        case pending
        case successful
        case failed
    }
    
    let id: String
    let type: TransactionType
    let amount: Double
    let description: String
    let date: Date
    let status: TransactionStatus
}

struct AccountDetails {
    let accountNumber: String
    let accountName: String
    let accountType: String
    let balance: Double
    let currency: String
}

struct Card {
    let id: String
    let cardType: String
    let lastFourDigits: String
    let expiryDate: String
    let isVirtual: Bool
}

struct Notification {
    let id: String
    let title: String
    let message: String
    let date: Date
    var isRead: Bool
}

struct Beneficiary {
    let id: String
    let name: String
    let accountNumber: String
    let bankName: String
}
