//
//  TransactionModel.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

struct TransactionModel {
    enum Category: String {
        case shopping = "Shopping"
        case food = "Food"
        case transportation = "Transportation"
        case entertainment = "Entertainment"
        case utilities = "Utilities"
        case income = "Income"
        case transfer = "Transfer"
        case other = "Other"
        
        var icon: String {
            switch self {
            case .shopping:
                return "cart.fill"
            case .food:
                return "fork.knife"
            case .transportation:
                return "car.fill"
            case .entertainment:
                return "tv.fill"
            case .utilities:
                return "bolt.fill"
            case .income:
                return "arrow.down.circle.fill"
            case .transfer:
                return "arrow.left.arrow.right"
            case .other:
                return "questionmark.circle.fill"
            }
        }
        
        var color: UIColor {
            switch self {
            case .shopping:
                return .systemOrange
            case .food:
                return .systemRed
            case .transportation:
                return .systemBlue
            case .entertainment:
                return .systemPurple
            case .utilities:
                return .systemYellow
            case .income:
                return .systemGreen
            case .transfer:
                return Constants.Colors.primaryGold
            case .other:
                return .systemGray
            }
        }
    }
    
    let title: String
    let date: Date
    let amount: Double
    let category: Category
    
    var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₦"
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: abs(amount))) ?? "₦0.00"
    }
    
    var isExpense: Bool {
        return amount < 0
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

