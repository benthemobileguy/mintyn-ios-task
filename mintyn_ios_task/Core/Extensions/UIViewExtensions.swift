//
//  UIView+Extensions.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

extension UIView {
    func addShadow(opacity: Float = 0.2, radius: CGFloat = 3, offset: CGSize = CGSize(width: 0, height: 2), color: UIColor = .black) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.masksToBounds = false
    }
    
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func addBorder(width: CGFloat = 1.0, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}

