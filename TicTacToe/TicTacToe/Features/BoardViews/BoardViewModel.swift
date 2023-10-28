//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import Foundation

protocol BoardViewModelDelegate: AnyObject {
    func setButtonImages(forPlayer: Int, at row: Int, column: Int)
    func showDrawMessage()
    func switchPlayerLabel(player: String)
    func clearCellImages()
    func disableButtons()
    func enableButtons()
    func updatePlayerLabelToWinner()
    func updatePlayerLabelToPlayer()
}

class BoardViewModel {
    weak var delegate: BoardViewModelDelegate?
    var coordinator: BoardCoordinating?
    var boardSize: BoardDimensions?
    var playerOneName: String?
    var playerTwoName: String?
    var game: Game
    var currentPlayer: Int = 1
    var gameEnded: Bool = false
    var winnerHistory: [String] = []
    
    init(coordinator: BoardCoordinating, game: Game) {
        self.coordinator = coordinator
        self.game = game
    }
    
    func makeMove(row: Int, column: Int) {
        if game.isValidMove(row: row, column: column) && !gameEnded {
            game.makeMove(row: row, column: column)
            delegate?.setButtonImages(forPlayer: currentPlayer, at: row, column: column)
            
            if game.checkForWin() != nil {
                gameEnded = true
                let winnerName = game.currentPlayerName()
                winnerHistory.append(winnerName)
                delegate?.disableButtons()
                delegate?.updatePlayerLabelToWinner()
            } else if game.isGameOver() {
                gameEnded = true
                delegate?.showDrawMessage()
                delegate?.disableButtons()
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
        gameEnded = false
        delegate?.enableButtons()
        delegate?.updatePlayerLabelToPlayer() 
    }
    
    func startNewGame() {
        coordinator?.startNewGame()
    }
}
