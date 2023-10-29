//
//  BoarView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    func didSelectField(at row: Int, column: Int)
    func didTappedResetGameButton()
    func didTappedNewGameButton()
}

class BoarView: UIView {
    weak var delegate: BoardViewDelegate?
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "BoarView.titleStackView"
        return stackView
    }()
    
    private lazy var boardTitle: UILabel = {
        let label = UILabel()
        label.text = "Vez do jogador"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.sFProText(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "BoarView.boardTitle"
        return label
    }()
    
    private lazy var namePlayerTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.sFProText(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "BoarView.namePlayerTitle"
        return label
    }()
    
    private lazy var ticTacToeBoard: CustomBoardStackView = {
        let stackView =  CustomBoardStackView(
            accessibilityIdentifier:"BoarView.ticTacToeBoard"
        )
        stackView.delegate = self
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "BoarView.buttonStackView"
        return stackView
    }()
    
    private lazy var resetGameButton: CustomButton = {
        return CustomButton(
            title: "Recomeçar",
            textColor: .white,
            backgroundColor: DesignSystem.Colors.tertiary,
            opacity: 1.0,
            cornerRadius: 14,
            font: UIFont.sFProText(ofSize: 17, weight: .bold),
            accessibilityIdentifier: "BoarView.resetGameButton"
        )
    }()
    
    private lazy var newGameButton: CustomButton = {
        return CustomButton(
            title: "Novo jogo",
            textColor: DesignSystem.Colors.tertiary,
            backgroundColor: DesignSystem.Colors.tertiary,
            opacity: 0.15,
            cornerRadius: 14,
            font: UIFont.sFProText(ofSize: 17, weight: .bold),
            accessibilityIdentifier: "BoarView.newGameButton"
        )
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setupConstraints()
        setupActions()
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
        
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(resetGameButton)
        buttonStackView.addArrangedSubview(newGameButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 121),
            titleStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -121),
            
            ticTacToeBoard.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 55),
            ticTacToeBoard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            ticTacToeBoard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            buttonStackView.topAnchor.constraint(equalTo: ticTacToeBoard.bottomAnchor, constant: 144),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - Actions
extension BoarView {
    func setupActions() {
        resetGameButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        newGameButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: CustomButton) {
        switch sender {
        case resetGameButton:
            delegate?.didTappedResetGameButton()
        case newGameButton:
            delegate?.didTappedNewGameButton()
        default:
            break
        }
    }
    
    func updateBoardSize(with dimension: BoardDimensions) {
        ticTacToeBoard.dimension = dimension.width
    }
    
    func setInitialPlayerName(_ name: String?) {
        guard let name else { return }
        namePlayerTitle.text = name
        namePlayerTitle.textColor = DesignSystem.Colors.tertiary
    }
    
    func updatePlayerNames(playerOne: String, playerTwo: String, at row: Int, column: Int) {
        let selectedPlayer: String
        let textColor: UIColor
        
        if namePlayerTitle.text == playerOne {
            selectedPlayer = playerTwo
            textColor = DesignSystem.Colors.accent
            //setButtonImages(forPlayer: 2, at: row, column: column)
        } else {
            selectedPlayer = playerOne
            textColor = DesignSystem.Colors.tertiary
            //setButtonImages(forPlayer: 1, at: row, column: column)
        }
        namePlayerTitle.text = selectedPlayer
        namePlayerTitle.textColor = textColor
    }
    
    func setButtonImages(forPlayer player: Player, at row: Int, column: Int) {
        let imageName: String
        if player == .PlayerOne {
            imageName = "player1_image"
        } else {
            imageName = "player2_image"
        }
        
        if let rowStack = ticTacToeBoard.arrangedSubviews[row] as? UIStackView,
           let button = rowStack.arrangedSubviews[column] as? CustomPlayerButton {
            button.playerImageView.image = UIImage(named: imageName)
            button.isUserInteractionEnabled = false
        }
    }
    
    func clearCellImages() {
        updateButtonState { button in
            button.playerImageView.image = nil
        }
    }
    
    func disableButtons() {
        updateButtonState { button in
            button.isUserInteractionEnabled = false
        }
    }
    
    func enableButtons() {
        updateButtonState { button in
            button.isUserInteractionEnabled = true
        }
    }
    
    func updatePlayerLabelToWinner() {
        boardTitle.text = "Vencedor 🏆"
    }
    
    func updatePlayerLabelToPlayer() {
        boardTitle.text = "Jogador da vez"
    }
    
    private func updateButtonState(buttonAction: (CustomPlayerButton) -> Void) {
        for rowStack in ticTacToeBoard.arrangedSubviews {
            guard let rowStack = rowStack as? UIStackView else { continue }
            for case let button as CustomPlayerButton in rowStack.arrangedSubviews {
                buttonAction(button)
                
            }
        }
    }
}

// MARK: - Delegate
extension BoarView: CustomBoardStackViewDelegate {
    func buttonPressed(at row: Int, column: Int) {
        //if let playerOne = namePlayerTitle.text, let playerTwo = namePlayerTitle.text {
            delegate?.didSelectField(at: row, column: column)
        //}
    }
}
