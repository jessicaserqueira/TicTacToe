//
//  BoardCoordinator.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import UIKit
class BoardCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let boardSize: BoardDimensions
    var playerOneName: String
    var playerTwoName: String
    
    init(navigationController: UINavigationController, boardSize: BoardDimensions, playerOneName: String, playerTwoName: String) {
        self.navigationController = navigationController
        self.boardSize = boardSize
        self.playerOneName = playerOneName
        self.playerTwoName = playerTwoName
    }
    
    func start() {
        let game = Game(boardSize: boardSize, playerOneName: playerOneName, playerTwoName: playerTwoName)
        let viewModel = BoardViewModel(coordinator: self, game: game)
        viewModel.boardSize = boardSize
        viewModel.playerOneName = playerOneName
        viewModel.playerTwoName = playerTwoName
        let viewController = BoardViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - Delegate
extension BoardCoordinator: BoardCoordinating {
    
}
