//
//  CustomButton.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class CustomButton: UIButton {
    
    init(
        title: String,
        textColor: UIColor,
        backgroundColor: UIColor?,
        opacity: CGFloat?,
        cornerRadius: CGFloat,
        font: UIFont,
        accessibilityIdentifier: String
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = accessibilityIdentifier
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.layer.cornerRadius = cornerRadius
        
        if let backgroundColor = backgroundColor {
            if let opacity = opacity {
                self.backgroundColor = backgroundColor.withAlphaComponent(opacity)
            } else {
                self.backgroundColor = backgroundColor
            }
        }
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Methods
extension CustomButton {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setBackground(backGroudColor: UIColor?, opacity: CGFloat?) {
        
    }
}
