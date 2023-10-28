//
//  GameResult.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 28/10/23.
//

import Foundation

enum GameResult: Equatable {
    case ongoing
    case win(Player)
    case draw
}

extension GameResult {
    static func checkResult(for board: [[Player?]]) -> GameResult {
        for row in 0..<board.count {
            let lineResult = checkLine(board[row])
            if case .win(_) = lineResult {
                return lineResult
            }
        }

        for col in 0..<board[0].count {
            let columnResult = checkColumn(board, at: col)
            if case .win(_) = columnResult {
                return columnResult
            }
        }

        let diagonal1Result = checkDiagonal1(board)
        if case .win(_) = diagonal1Result {
            return diagonal1Result
        }

        let diagonal2Result = checkDiagonal2(board)
        if case .win(_) = diagonal2Result {
            return diagonal2Result
        }

        let isDraw = board.allSatisfy { row in
            return row.allSatisfy { $0 != nil }
        }

        return isDraw ? .draw : .ongoing
    }

    private static func checkLine(_ line: [Player?]) -> GameResult {
        if let firstPlayer = line.first {
            if line.allSatisfy({ $0 == firstPlayer }) {
                if let unwrappedPlayer = firstPlayer {
                    return .win(unwrappedPlayer)
                }
            }
        }
        return .ongoing
    }
    
    private static func checkColumn(_ board: [[Player?]], at column: Int) -> GameResult {
        let column = board.map { $0[column] }
        return checkLine(column)
    }
    
    private static func checkDiagonal1(_ board: [[Player?]]) -> GameResult {
        let diagonal = (0..<board.count).map { board[$0][$0] }
        return checkLine(diagonal)
    }
    
    private static func checkDiagonal2(_ board: [[Player?]]) -> GameResult {
        let diagonal = (0..<board.count).map { board[$0][board.count - 1 - $0] }
        return checkLine(diagonal)
    }
}
