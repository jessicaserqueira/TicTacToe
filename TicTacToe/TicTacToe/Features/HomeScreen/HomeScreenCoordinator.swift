//
//  ViewCoordinator.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class HomeScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeScreenViewModel(coordinator: self)
        let viewController = HomeScreenViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeScreenCoordinator: HomeScreenCoordinating {
    func showBoardScreen(with game: Game) {
        let coordinator = BoardCoordinator(navigationController: navigationController, boardSize: game.boardSize, playerOneName: game.playerOneName, playerTwoName: game.playerTwoName)
        coordinator.start()
    }
}
