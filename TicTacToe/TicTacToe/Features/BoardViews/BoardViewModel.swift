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
    
    init(coordinator: BoardCoordinating) {
        self.coordinator = coordinator
    }
}
