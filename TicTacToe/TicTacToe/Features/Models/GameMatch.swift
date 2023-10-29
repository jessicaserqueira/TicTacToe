//
//  GameMatch.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 28/10/23.
//

import Foundation

struct GameMatch: Codable {
    let playerOne: String
    let playerTwo: String
    let date: Date

    init(playerOne: String, playerTwo: String, date: Date) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.date = date
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        playerOne = try container.decode(String.self, forKey: .playerOne)
        playerTwo = try container.decode(String.self, forKey: .playerTwo)
        date = try container.decode(Date.self, forKey: .date)
    }

    enum CodingKeys: String, CodingKey {
        case playerOne
        case playerTwo
        case date
    }
}
