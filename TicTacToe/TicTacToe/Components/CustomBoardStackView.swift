//
//  CustomStackView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol CustomBoardStackViewDelegate: AnyObject {
    func buttonPressed(at row: Int, column: Int)
}

class CustomBoardStackView: UIStackView {
    weak var delegate: CustomBoardStackViewDelegate?
    
    var dimension: Int = 3 {
        didSet {
            updateBoard()
        }
    }
    
    init(accessibilityIdentifier: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillProportionally
        self.accessibilityIdentifier = accessibilityIdentifier
        updateBoard()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - METHODS
extension CustomBoardStackView {
    private func clearBoard() {
        for subview in arrangedSubviews {
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    private func createButtonWith() -> CustomPlayerButton {
        let button = CustomPlayerButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = DesignSystem.Colors.borderColorBoard.cgColor
        return button
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 346)
        ])
    }
    
    private func createRowStackView() -> UIStackView {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.distribution = .fillEqually
        return rowStackView
    }
    
    private func createBoard() {
        for row in 0..<dimension {
            let rowStackView = createRowStackView()
            
            for column in 0..<dimension {
                let button = createButtonWith()
                button.tag = row * dimension + column
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                
                rowStackView.addArrangedSubview(button)
            }
            addArrangedSubview(rowStackView)
        }
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        let row = sender.tag / dimension
        let column = sender.tag % dimension
        
        delegate?.buttonPressed(at: row, column: column)
    }
    
    private func updateBoard() {
        clearBoard()
        createBoard()
    }
}
