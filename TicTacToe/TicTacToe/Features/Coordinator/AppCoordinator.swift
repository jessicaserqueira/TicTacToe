//
//  AppCoordinator.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var navigationBarController: UINavigationBar
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.navigationBarController = UINavigationBar()
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let viewCoordinator = HomeScreenCoordinator(navigationController: navigationController)
        coordinate(to: viewCoordinator)
    }
}
