//
//  CustomTextField.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class CustomTextField: UITextField {
    var type: String

    init(
        placeholder: String,
        type: String,
        accessibilityIdentifier: String
    ) {
        self.type = type
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.accessibilityIdentifier = accessibilityIdentifier
        self.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        createPlaceholder()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension CustomTextField {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        ])
    }
    
    private func createPlaceholder() {
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
}

