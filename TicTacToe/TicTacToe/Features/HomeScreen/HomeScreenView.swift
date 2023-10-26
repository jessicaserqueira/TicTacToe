//
//  HomeScreenView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class HomeScreenView: UIView {
    let jogadores = ["vs Jogador", "vs Bot"]
    let selectedSegmentIndex = 0
    
    private lazy var segmentedButton: CustomUISegmentedControl = {
        let button = CustomUISegmentedControl(
            segmentTitles: jogadores,
            selectedSegmentIndex: selectedSegmentIndex,
            accessibilityIdentifier: "HomeScreenView.segmentedButton"
        )
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()
    
    private lazy var startMatchButton: CustomButton = {
        return CustomButton(
            title: "Começar Partida",
            textColor: .white,
            backgroundColor: DesignSystem.Colors.tertiary,
            cornerRadius: 14,
            font: UIFont.sFProText(ofSize: 17, weight: .bold),
            accessibilityIdentifier: "HomeScreenView.startMatch"
        )
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
            accessibilityIdentifier: "HomeScreenView.playerTwoTextField"
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
        addSubview(segmentedButton)
        addSubview(startMatchButton)
        addSubview(playerOneTextField)
        addSubview(playerTwoTextField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            
            startMatchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startMatchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            
            playerOneTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            playerOneTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            playerTwoTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            playerTwoTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250),
        ])
    }
}

// MARK: - Actions
extension HomeScreenView {
    func setupActions() {
        
    }
}

// MARK: - Delegates
extension HomeScreenView: CustomSegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: CustomUISegmentedControl, didSelectSegmentAtIndex index: Int) {
    }
}
