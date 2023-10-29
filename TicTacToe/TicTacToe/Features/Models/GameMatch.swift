//
//  GameMatch.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 28/10/23.
//

import Foundation

struct GameMatch: Codable {
    internal init(playerOne: PlayerEntity, playerTwo: PlayerEntity, date: Date = Date()) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.date = date
    }
    
    let playerOne: PlayerEntity
    let playerTwo: PlayerEntity
    let date: Date

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        playerOne = try container.decode(PlayerEntity.self, forKey: .playerOne)
        playerTwo = try container.decode(PlayerEntity.self, forKey: .playerTwo)
        date = try container.decode(Date.self, forKey: .date)
    }

    enum CodingKeys: String, CodingKey {
        case playerOne
        case playerTwo
        case date
    }
}
