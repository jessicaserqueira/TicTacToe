//
//  HomeScreenView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol HomeScreenViewDelegate: AnyObject {
    func didTappedStartMatchButton(withBoardSize boardSize: BoardDimensions, playerOne: String, playerTwo: String)
}

class HomeScreenView: UIView {
    weak var delegate: HomeScreenViewDelegate?
    
    let dimensions: [BoardDimensions] = [.threeByThree, .fourByFour, .fiveByFive, .sixBySix, .sevenBySeven, .eightByEight, .nineByNine, .tenByTen]
    var selectedSegmentIndex = 0
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoClear")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "HomeScreenView.logoImageView"
        return imageView
    }()
    
    private lazy var playerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "HomeScreenView.playerStackView"
        return stackView
    }()
    
    private lazy var titlePlayer: UILabel = {
        let labal = UILabel()
        labal.text = "Nome dos jogadores"
        labal.font = UIFont.sFProText(ofSize: 20, weight: .medium)
        labal.textColor = .black
        labal.textAlignment = .center
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal.accessibilityIdentifier = "HomeScreenView.titlePlayer"
        return labal
    }()
    
    private lazy var playerOneTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Jogador 1",
            type: "Jogador 1",
            accessibilityIdentifier: "HomeScreenView.playerOneTextField"
        )
    }()
    
    private lazy var playerTwoTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Jogador 2",
            type: "Jogador 2",
            accessibilityIdentifier: "HomeScreenView.playerOneTextField"
        )
    }()
    
    private lazy var boardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "HomeScreenView.boardStackView"
        return stackView
    }()
    
    private lazy var titleBoard: UILabel = {
        let labal = UILabel()
        labal.text = "Tamanho do tabuleiro"
        labal.textAlignment = .center
        labal.font = UIFont.sFProText(ofSize: 20, weight: .medium)
        labal.textColor = .black
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal.accessibilityIdentifier = "HomeScreenView.titleBoard"
        return labal
    }()
    
    private lazy var segmentedButton: CustomUISegmentedControl = {
        let button = CustomUISegmentedControl(
            segmentTitles: dimensions.map {$0.stringValue},
            selectedSegmentIndex: selectedSegmentIndex,
            accessibilityIdentifier: "HomeScreenView.segmentedButton"
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = "HomeScreenView.buttonStackView"
        return stackView
    }()
    
    private lazy var startMatchButton: CustomButton = {
        return CustomButton(
            title: "Começar Partida",
            textColor: .white,
            backgroundColor: DesignSystem.Colors.tertiary,
            opacity: 1.0,
            cornerRadius: 14,
            font: UIFont.sFProText(ofSize: 17, weight: .bold),
            accessibilityIdentifier: "HomeScreenView.startMatchButton"
        )
    }()
    
    private lazy var matchHistoryButton: CustomButton = {
        return CustomButton(
            title: "Histórico das Partidas",
            textColor: DesignSystem.Colors.tertiary,
            backgroundColor: DesignSystem.Colors.tertiary,
            opacity: 0.15,
            cornerRadius: 14,
            font: UIFont.sFProText(ofSize: 17, weight: .bold),
            accessibilityIdentifier: "HomeScreenView.matchHistoryButton"
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
extension HomeScreenView {
    private func configureSubviews() {
        addSubview(logoImageView)
        
        addSubview(playerStackView)
        playerStackView.addArrangedSubview(titlePlayer)
        playerStackView.addArrangedSubview(playerOneTextField)
        playerStackView.addArrangedSubview(playerTwoTextField)
        
        addSubview(boardStackView)
        boardStackView.addArrangedSubview(titleBoard)
        boardStackView.addArrangedSubview(segmentedButton)
        
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(startMatchButton)
        buttonStackView.addArrangedSubview(matchHistoryButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 85),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -85),
            logoImageView.heightAnchor.constraint(equalToConstant: 95),
            
            playerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            playerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            playerStackView.bottomAnchor.constraint(equalTo: boardStackView.topAnchor, constant: -60),
            
            boardStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            boardStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            boardStackView.topAnchor.constraint(equalTo: playerStackView.bottomAnchor, constant: 60),
            
            buttonStackView.topAnchor.constraint(equalTo: boardStackView.bottomAnchor, constant: 85),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - Actions
extension HomeScreenView {
    func setupActions() {
        startMatchButton.addTarget(self, action: #selector(didTappedStartMatchButton), for: .touchUpInside)
    }
    
    @objc func didTappedStartMatchButton() {
        let playerOne = playerOneTextField.text ?? ""
        let playerTwo = playerTwoTextField.text ?? ""
        let dimension = dimensions[selectedSegmentIndex]
        delegate?.didTappedStartMatchButton(withBoardSize: dimension, playerOne: playerOne, playerTwo: playerTwo)
    }
}

// MARK: - Delegates
extension HomeScreenView: CustomSegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: CustomUISegmentedControl, didSelectSegmentAtIndex index: Int) {
        selectedSegmentIndex = index
    }
}
