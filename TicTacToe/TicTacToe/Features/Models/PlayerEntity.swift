//
//  PlayerEntity.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 29/10/23.
//

import Foundation

struct PlayerEntity: Codable {
    internal init(winner: Bool = false, player: String) {
        self.winner = winner
        self.player = player
    }
    
    let winner: Bool
    let player: String
}
