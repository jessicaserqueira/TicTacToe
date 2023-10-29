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
    var playerOneName: String?
    var playerTwoName: String?
    
    init(coordinator: HomeScreenCoordinating) {
        self.coordinator = coordinator
    }
    
    func didTappedStartMatchButton() {
        guard let boardSize = selectedBoardSize,
              let playerOneName = playerOneName,
              let playerTwoName = playerTwoName,
              !playerOneName.isEmpty,
              !playerTwoName.isEmpty else {
            return
        }
        
        let game = Game(boardSize: boardSize, playerOneName: playerOneName, playerTwoName: playerTwoName)
        coordinator?.showBoardScreen(with: game)
    }
    
    func showHistoricView() {
        coordinator?.showHisctoricView()
    }
}
