//
//  Constants.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

struct Constants {
    struct Colors {
        
        static let primaryGold = UIColor(red: 196/255, green: 163/255, blue: 98/255, alpha: 1.0)
        
        // Text colors
        static let textPrimary = UIColor.black
        static let textSecondary = UIColor.darkGray
        // Background color
        static let background = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    }
    
    struct Fonts {
        static func regular(size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        
        static func medium(size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .medium)
        }
        
        static func semibold(size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        }
        
        static func bold(size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}


