//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import Foundation

protocol BoardViewModelDelegate: AnyObject {
    func setButtonImages(forPlayer: Int, at row: Int, column: Int)
    func showWinMessage(winner: String)
    func showDrawMessage()
    func switchPlayerLabel(player: String)
    func clearCellImages()
}

class BoardViewModel {
    weak var delegate: BoardViewModelDelegate?
    var coordinator: BoardCoordinating?
    var boardSize: BoardDimensions?
    var playerOneName: String?
    var playerTwoName: String?
    var game: Game
    var currentPlayer: Int = 1
    
    init(coordinator: BoardCoordinating, game: Game) {
        self.coordinator = coordinator
        self.game = game
    }
    
    func makeMove(row: Int, column: Int) {
        if game.isValidMove(row: row, column: column) {
            game.makeMove(row: row, column: column)
            delegate?.setButtonImages(forPlayer: currentPlayer, at: row, column: column)
            
            if (game.checkForWin() != nil) {
                let winner = game.currentPlayerName()
                delegate?.showWinMessage(winner: winner)
            } else if game.isGameOver() {
                delegate?.showDrawMessage()
            } else {
                game.switchPlayer()
                let player = game.currentPlayerName()
                delegate?.switchPlayerLabel(player: player)
            }
        }
    }
    
    func resetGame() {
        game.resetGame()
        delegate?.clearCellImages()
    }
    
    func startNewGame() {
        coordinator?.startNewGame()
    }
}
