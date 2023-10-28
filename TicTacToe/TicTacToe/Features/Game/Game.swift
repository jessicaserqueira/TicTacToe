//
//  Game.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import UIKit

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
        board = Array(repeating: Array(repeating: nil, count: boardSize.width), count: boardSize.height)
    }
    
    func makeMove(row: Int, column: Int) {
        if isValidMove(row: row, column: column) {
            board[row][column] = currentPlayer
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
    
    func checkForWin() -> Player? {
        for row in 0..<board.count {
            if let player = checkLine(board[row]) {
                return player
            }
        }
        
        for col in 0..<board[0].count {
            if let player = checkColumn(board, at: col) {
                return player
            }
        }
        
        if let player = checkDiagonalOne(board) {
            return player
        }
        
        if let player = checkDiagonalTwo(board) {
            return player
        }
        
        return nil
    }
    
    func isGameOver() -> Bool {
        return checkForWin() != nil || boardIsFull()
    }
    
    func resetGame() {
        reset()
    }
    
    private func checkLine(_ line: [Player?]) -> Player? {
        if let firstPlayer = line.first, line.allSatisfy({ $0 == firstPlayer }) {
            return firstPlayer
        }
        return nil
    }
    
    private func checkColumn(_ board: [[Player?]], at column: Int) -> Player? {
        let column = board.map { $0[column] }
        return checkLine(column)
    }
    
    private func checkDiagonalOne(_ board: [[Player?]]) -> Player? {
        let diagonal = (0..<board.count).map { board[$0][$0] }
        return checkLine(diagonal)
    }
    
    private func checkDiagonalTwo(_ board: [[Player?]]) -> Player? {
        let diagonal = (0..<board.count).map { board[$0][board.count - 1 - $0] }
        return checkLine(diagonal)
    }
    
    private func boardIsFull() -> Bool {
        return board.allSatisfy { row in row.allSatisfy { $0 != nil } }
    }
}
