//
//  PageIndicator.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class PageIndicator: UIView {
    private var dotViews: [UIView] = []
    private var currentPage: Int = 0
    private var numberOfPages: Int = 0
    
    init(numberOfPages: Int, currentPage: Int = 0) {
        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
        super.init(frame: .zero)
        setupDots()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupDots() {
        // Clear existing dots
        dotViews.forEach { $0.removeFromSuperview() }
        dotViews.removeAll()
        
        let dotSize: CGFloat = 8
        let spacing: CGFloat = 8
        
        for i in 0..<numberOfPages {
            let dotView = UIView()
            dotView.translatesAutoresizingMaskIntoConstraints = false
            dotView.layer.cornerRadius = dotSize / 2
            dotView.backgroundColor = i == currentPage ? Constants.Colors.primaryGold : .lightGray
            
            addSubview(dotView)
            
            NSLayoutConstraint.activate([
                dotView.widthAnchor.constraint(equalToConstant: i == currentPage ? dotSize * 3 : dotSize),
                dotView.heightAnchor.constraint(equalToConstant: dotSize),
                dotView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            
            if i == 0 {
                dotView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            } else {
                dotView.leadingAnchor.constraint(equalTo: dotViews[i-1].trailingAnchor, constant: spacing).isActive = true
            }
            
            if i == numberOfPages - 1 {
                dotView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            }
            
            dotViews.append(dotView)
        }
    }
    
    func setCurrentPage(_ page: Int) {
        guard page < numberOfPages && page >= 0 else { return }
        
        currentPage = page
        
        for (index, dotView) in dotViews.enumerated() {
            UIView.animate(withDuration: 0.3) {
                dotView.backgroundColor = index == self.currentPage ? Constants.Colors.primaryGold : .lightGray
                
                // Resize the dot
                if index == self.currentPage {
                    dotView.layer.bounds.size.width = 24 // Wider dot for current page
                } else {
                    dotView.layer.bounds.size.width = 8 // Regular dot
                }
                dotView.layer.cornerRadius = 4
            }
        }
    }
}
