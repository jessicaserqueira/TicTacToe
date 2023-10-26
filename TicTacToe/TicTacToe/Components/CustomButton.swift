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
        cornerRadius: CGFloat,
        font: UIFont,
        accessibilityIdentifier: String
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = accessibilityIdentifier
        
        setTitle(title, for: .normal)
        setTitleColor(textColor, for: .normal)
        
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        layer.cornerRadius = cornerRadius
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 342),
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
