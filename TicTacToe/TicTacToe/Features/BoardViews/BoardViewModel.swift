//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import Foundation

class BoardViewModel {
    var coordinator: BoardCoordinating?
    var boardSize: BoardDimensions?
    var playerOneName: String?
    var playerTwoName: String?
    var game: Game

    init(coordinator: BoardCoordinating, game: Game) {
        self.coordinator = coordinator
        self.game = game
    }

    func resetGame() {
        game.reset()
    }

    func makeMove(at row: Int, column: Int) {

    }

    func currentPlayerName() -> String {
        return game.currentPlayerName()
    }
}
