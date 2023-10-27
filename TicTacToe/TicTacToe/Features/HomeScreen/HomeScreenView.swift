//
//  HomeScreenView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol HomeScreenViewDelegate: AnyObject {
    func didTappedStartMatchButton(withBoardSize boardSize: BoardDimensions)
}

class HomeScreenView: UIView {
    weak var delegate: HomeScreenViewDelegate?
    let dimensions: [BoardDimensions] = [.threeByThree, .fourByFour, .fiveByFive, .sixBySix, .sevenBySeven, .eightByEight, .nineByNine, .tenByTen]
    var selectedSegmentIndex = 0
    
    private lazy var boardTitle: UILabel = {
        let labal = UILabel()
        labal.text = "Tamanho do tabuleiro"
        labal.font = UIFont.sFProText(ofSize: 20, weight: .medium)
        labal.textColor = .black
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal.accessibilityIdentifier = "HomeScreenView.boardTitle"
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
    
    private lazy var startMatchButton: CustomButton = {
        return CustomButton(
            title: "Começar Partida",
            textColor: .white,
            backgroundColor: DesignSystem.Colors.tertiary,
            opacity: 1.0,
            cornerRadius: 14,
            font: UIFont.sFProText(ofSize: 17, weight: .bold),
            accessibilityIdentifier: "HomeScreenView.startMatch"
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
            accessibilityIdentifier: "HomeScreenView.startMatch"
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
        addSubview(boardTitle)
        addSubview(segmentedButton)
        addSubview(startMatchButton)
        addSubview(matchHistoryButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            boardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            boardTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -89),
            boardTitle.bottomAnchor.constraint(equalTo: segmentedButton.topAnchor, constant: -18),
            
            segmentedButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            segmentedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            startMatchButton.topAnchor.constraint(equalTo: segmentedButton.bottomAnchor, constant: 87),
            startMatchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startMatchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            matchHistoryButton.topAnchor.constraint(equalTo: startMatchButton.bottomAnchor, constant: 8),
            matchHistoryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            matchHistoryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            matchHistoryButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}

// MARK: - Actions
extension HomeScreenView {
    func setupActions() {
        startMatchButton.addTarget(self, action: #selector(didTappedStartMatchButton), for: .touchUpInside)
    }
    
    @objc func didTappedStartMatchButton() {
        let dimension = dimensions[selectedSegmentIndex]
        delegate?.didTappedStartMatchButton(withBoardSize: dimension)
    }
}

// MARK: - Delegates
extension HomeScreenView: CustomSegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: CustomUISegmentedControl, didSelectSegmentAtIndex index: Int) {
        selectedSegmentIndex = index
    }
}
