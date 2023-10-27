//
//  HomeScreenViewModel.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import Foundation

class HomeScreenViewModel {
    var coordinator: HomeScreenCoordinating?
    var selectedBoardSize: BoardDimensions?
    
    init(coordinator: HomeScreenCoordinating) {
        self.coordinator = coordinator
    }
    
    func didTappedStartMatchButton(withBoardSize boardSize: BoardDimensions) {
        selectedBoardSize = boardSize
        coordinator?.showBoardScreen(withBoardSize: boardSize)
    }
}
