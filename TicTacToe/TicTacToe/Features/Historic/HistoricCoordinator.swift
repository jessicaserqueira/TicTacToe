//
//  HistoricCoordinator.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class HistoricCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HistoricViewModel(coordinator: self)
        let viewController = HistoricViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

//MARK: - Delegate
extension HistoricCoordinator: HistoricCoordinating {}
