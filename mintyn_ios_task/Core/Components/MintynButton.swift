//
//  MintynButton.swift
//  mintyn_ios_task
//
//  Created by Ben on 12/03/2025.
//

import UIKit

class MintynButton: UIButton {
    
    enum ButtonStyle {
        case primary
        case secondary
    }
    
    private var style: ButtonStyle = .primary
    
    init(title: String, style: ButtonStyle = .primary) {
        super.init(frame: .zero)
        self.style = style
        setup(with: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(with: "")
    }
    
    private func setup(with title: String) {
        setTitle(title, for: .normal)
        titleLabel?.font = Constants.Fonts.semibold(size: 16)
        
        switch style {
        case .primary:
            // Gold gradient matching the left image
            backgroundColor = Constants.Colors.primaryGold
            setTitleColor(.white, for: .normal)
        case .secondary:
            // Black button matching the left image
            backgroundColor = .black
            setTitleColor(.white, for: .normal)
        }
        
        layer.cornerRadius = 16 // Matching rounded corners in left image
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
}

