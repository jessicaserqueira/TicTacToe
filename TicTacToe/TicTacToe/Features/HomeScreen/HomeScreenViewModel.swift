//
//  HomeScreenViewModel.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import Foundation

class HomeScreenViewModel {
    var coordinator: HomeScreenCoordinating?
    
    init(coordinator: HomeScreenCoordinating) {
        self.coordinator = coordinator
    }
    
    func didTapSignUpButton() {
        coordinator?.showBoardScreen()
    }
}
