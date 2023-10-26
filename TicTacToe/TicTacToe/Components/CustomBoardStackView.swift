//
//  CustomStackView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class CustomBoardStackView: UIStackView {
    
    init(
        dimension: Int,
        accessibilityIdentifier: String
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.accessibilityIdentifier = accessibilityIdentifier
        
        for _ in 0..<dimension {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            
            for _ in 0..<dimension {
                let button = UIButton()
                button.setTitle("", for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.backgroundColor = .white
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                button.layer.borderWidth = 1
                button.layer.borderColor = DesignSystem.Colors.borderColorBoard.cgColor
                
                rowStackView.addArrangedSubview(button)
            }
            
            addArrangedSubview(rowStackView)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
    
    }
}
