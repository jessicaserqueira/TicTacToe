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
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
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
