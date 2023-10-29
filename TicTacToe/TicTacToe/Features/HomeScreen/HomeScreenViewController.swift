//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 25/10/23.
//

import UIKit

class HomeScreenViewController: UIViewController {
    var viewModel: HomeScreenViewModel
    var customView = HomeScreenView()

    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.delegate = self
        view.backgroundColor = DesignSystem.Colors.background
    }
}

// MARK: - Delegates
extension HomeScreenViewController: HomeScreenViewDelegate {    
    func didTappedStartMatchButton(withBoardSize boardSize: BoardDimensions, playerOne: String, playerTwo: String) {
        viewModel.selectedBoardSize = boardSize
        viewModel.playerOneName = playerOne
        viewModel.playerTwoName = playerTwo
        viewModel.didTappedStartMatchButton()
    }
    
    func didTappedHistoryButton(playerOne: String, playerTwo: String) {
        viewModel.playerOneName = playerOne
        viewModel.playerTwoName = playerTwo
        viewModel.showHistoricView()
    }
}
