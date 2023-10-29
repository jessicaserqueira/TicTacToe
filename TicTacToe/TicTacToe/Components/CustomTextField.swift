//
//  CustomTextField.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class CustomTextField: UITextField {
    
    private enum Metrics {
        static let borderLineOpacity: Float = 0.6
    }
    
    private enum Constants {
        static let playerOne = "Jogador 1"
        static let playerTwo = "Jogador 2"
    }
    
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
        self.autocorrectionType = .no
        self.delegate = self
        
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
        if type == Constants.playerOne || type == Constants.playerTwo {
            let borderLine = UIView()
            borderLine.translatesAutoresizingMaskIntoConstraints = false
            borderLine.backgroundColor = .gray
            borderLine.layer.opacity = Metrics.borderLineOpacity
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

// MARK: - UITextFieldDelegate
extension CustomTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if type == Constants.playerOne || type == Constants.playerTwo {
            if string.contains(" ") {
                return false
            }
        }
        return true
    }
}
