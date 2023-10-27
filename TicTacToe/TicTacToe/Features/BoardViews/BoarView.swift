//
//  BoarView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    func didSelectField(at row: Int, column: Int)
}

class BoarView: UIView {
    weak var delegate: BoardViewDelegate?
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "BoarView.titleStackView"
        return stackView
    }()
    
    private lazy var boardTitle: UILabel = {
        let labal = UILabel()
        labal.text = "Vez do jogador"
        labal.font = UIFont.sFProText(ofSize: 20, weight: .medium)
        labal.textColor = .black
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal.accessibilityIdentifier = "BoarView.boardTitle"
        return labal
    }()
    
    private lazy var namePlayerTitle: UILabel = {
        let labal = UILabel()
        labal.text = ""
        labal.textAlignment = .center
        labal.font = UIFont.sFProText(ofSize: 24, weight: .bold)
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal.accessibilityIdentifier = "BoarView.namePlayerTitle"
        return labal
    }()
    
    private  lazy var ticTacToeBoard: CustomBoardStackView = {
        return CustomBoardStackView(
            accessibilityIdentifier:"BoarView.ticTacToeBoard"
        )
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
extension BoarView {
    private func configureSubviews() {
        addSubview(titleStackView)
        titleStackView.addArrangedSubview(boardTitle)
        titleStackView.addArrangedSubview(namePlayerTitle)
        
        addSubview(ticTacToeBoard)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 121),
            titleStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -121),
            
            ticTacToeBoard.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 87),
            ticTacToeBoard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            ticTacToeBoard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
        ])
    }
}

// MARK: - Actions
extension BoarView {
    func updateBoardSize(with dimension: BoardDimensions) {
        ticTacToeBoard.dimension = dimension.width
    }
    
    func updatePlayerNames(playerOne: String, playerTwo: String) {
        let selectedPlayer: String
        let textColor: UIColor
        
        if namePlayerTitle.text == playerOne {
            selectedPlayer = playerTwo
            textColor = DesignSystem.Colors.accent
        } else {
            selectedPlayer = playerOne
            textColor = DesignSystem.Colors.tertiary
        }
        
        namePlayerTitle.text = selectedPlayer
        namePlayerTitle.textColor = textColor
    }
    
    @objc private func fieldSelected(_ sender: UIButton) {
        
    }
}
