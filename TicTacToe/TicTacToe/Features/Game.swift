//
//  Game.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import Foundation

class Game {
    var boardSize: BoardDimensions
    var playerOneName: String
    var playerTwoName: String
    var currentPlayer: Player
    var board: [[Player?]]

    init(boardSize: BoardDimensions, playerOneName: String, playerTwoName: String) {
        self.boardSize = boardSize
        self.playerOneName = playerOneName
        self.playerTwoName = playerTwoName
        self.currentPlayer = .PlayerOne
        self.board = Array(repeating: Array(repeating: nil, count: boardSize.width), count: boardSize.height)
    }

    func reset() {
        currentPlayer = .PlayerOne
        board = Array(repeating: Array(repeating: nil, count: boardSize.width), count: boardSize.width)
    }

    func makeMove(row: Int, column: Int) {
        if isValidMove(row: row, column: column) {
            board[row][column] = currentPlayer
            switchPlayer()
        }
    }
    func isValidMove(row: Int, column: Int) -> Bool {
        return board[row][column] == nil
    }

    func switchPlayer() {
        currentPlayer = (currentPlayer == .PlayerOne) ? .PlayerTwo : .PlayerOne
    }

    func currentPlayerName() -> String {
        return (currentPlayer == .PlayerOne) ? playerOneName : playerTwoName
    }

    func checkForWin() -> Bool {
        
        return false
    }

    func isGameOver() -> Bool {
       
        return false
    }
}
