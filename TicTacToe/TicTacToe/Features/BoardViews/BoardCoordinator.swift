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
    
    init(navigationController: UINavigationController, boardSize: BoardDimensions) {
        self.navigationController = navigationController
        self.boardSize = boardSize
    }
    
    func start() {
        let viewModel = BoardViewModel(coordinator: self)
        viewModel.boardSize = boardSize
        let viewController = BoardViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - Delegate
extension BoardCoordinator: BoardCoordinating {
    
}
