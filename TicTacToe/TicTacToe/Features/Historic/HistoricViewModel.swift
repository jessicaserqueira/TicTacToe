//
//  HistoricViewModel.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import Foundation

class HistoricViewModel {
    var coordinator: HistoricCoordinating?
    var gameMatches: [GameMatch] = []
    var playerOneName: String?
    var playerTwoName: String?
    
    init(coordinator: HistoricCoordinating?) {
        self.coordinator = coordinator
        loadGameMatches()
    }
    
    func loadGameMatches() {
        gameMatches = HistoricManager.shared.gameMatches
    }
    
    func addGameMatch() {
        let playerOne = PlayerEntity(player: playerOneName ?? "")
        let playerTwo = PlayerEntity(player: playerTwoName ?? "")
        let gameMatch = GameMatch(playerOne: playerOne,
                                  playerTwo: playerTwo)
        gameMatches.append(gameMatch)
        HistoricManager.shared.saveGameMatches()
        HistoricManager.shared.addGameMatch(gameMatch)
    }
}
