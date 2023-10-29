//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import Foundation

protocol BoardViewModelDelegate: AnyObject {
    func setButtonImages(forPlayer: Player, at row: Int, column: Int)
    func showDrawMessage()
    func clearCellImages()
    func disableButtons()
    func enableButtons()
    func updatePlayerLabelToWinner()
    func updatePlayerLabelToPlayer()
    func updatePlayerNames(at row: Int, column: Int)
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
    var gameHistory: [GameMatch] = []
    
    
    init(coordinator: BoardCoordinating, game: Game) {
        self.coordinator = coordinator
        self.game = game
    }
    
    private func handleValidMove(row: Int, column: Int) {
        game.makeMove(row: row, column: column)
        delegate?.setButtonImages(forPlayer: game.currentPlayer, at: row, column: column)
    }
    
    private func handleWin() {
        gameEnded = true
        let gameMatch = GameMatch(playerOne: playerOneName ?? "", playerTwo: playerTwoName ?? "", date: Date())
        gameHistory.append(gameMatch)
        HistoricManager.shared.addGameMatch(gameMatch)
        HistoricManager.shared.saveGameMatches()
        delegate?.disableButtons()
        delegate?.updatePlayerLabelToWinner()
    }
    
    private func handleDraw() {
        gameEnded = true
        delegate?.showDrawMessage()
        delegate?.disableButtons()
    }
    
    private func switchPlayer() {
        game.switchPlayer()
    }
    
    private func checkGameState(row: Int, column: Int) {
        if game.checkForWin() != nil {
            handleWin()
        } else if game.isGameOver() {
            handleDraw()
            delegate?.disableButtons()
        } else {
            switchPlayer()
        }
    }
}

// MARK: - Public  Methods
extension BoardViewModel {
    func makeMove(row: Int, column: Int) {
        if gameEnded {
            return
        }
        
        if game.isValidMove(row: row, column: column) {
            handleValidMove(row: row, column: column)
            checkGameState(row: row, column: column)
        }
        
        if !game.hasWinner {
            delegate?.updatePlayerNames(at: row, column: column)
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
