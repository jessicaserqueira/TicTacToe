//
//  SceneDelegate.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 25/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func scene(_ scene: UIScene,willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if let window = window {
            let coordinator = AppCoordinator(window: window)
            coordinator.start()
        }
    }
}
