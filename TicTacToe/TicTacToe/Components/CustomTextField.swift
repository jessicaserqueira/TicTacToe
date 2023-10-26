//
//  CustomTextField.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class CustomTextField: UITextField {
    
    init(
        placeholder: String,
        type: String,
        accessibilityIdentifier: String
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = accessibilityIdentifier
        
        self.placeholder = placeholder
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 342),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        ])
        
        if type == "Jogador 1" || type == "Jogador 2" {
            let borderLine = UIView()
            borderLine.translatesAutoresizingMaskIntoConstraints = false
            borderLine.backgroundColor = .gray
            borderLine.layer.opacity = 0.6
            addSubview(borderLine)
            
            NSLayoutConstraint.activate([
                borderLine.leadingAnchor.constraint(equalTo: leadingAnchor),
                borderLine.trailingAnchor.constraint(equalTo: trailingAnchor),
                borderLine.bottomAnchor.constraint(equalTo: bottomAnchor),
                borderLine.heightAnchor.constraint(equalToConstant: 1)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
