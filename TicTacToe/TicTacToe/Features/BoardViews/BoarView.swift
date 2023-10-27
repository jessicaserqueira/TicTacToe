//
//  BoarView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    
}

class BoarView: UIView {
    weak var delegate: BoardViewDelegate?
    
    private lazy var boardTitle: UILabel = {
        let labal = UILabel()
        labal.text = "Vez do jogador"
        labal.font = UIFont.sFProText(ofSize: 20, weight: .medium)
        labal.textColor = .black
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal.accessibilityIdentifier = "HomeScreenView.boardTitle"
        return labal
    }()
    
    lazy var ticTacToeBoard: CustomBoardStackView = {
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
        addSubview(boardTitle)
        addSubview(ticTacToeBoard)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            boardTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            boardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 121),
            boardTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -121),
            
            ticTacToeBoard.topAnchor.constraint(equalTo: boardTitle.bottomAnchor, constant: 87),
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
}
