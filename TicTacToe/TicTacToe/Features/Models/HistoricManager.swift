//
//  HistoricManager.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 29/10/23.
//

import Foundation

class HistoricManager {
    var gameMatches: [GameMatch] = []
    static let shared = HistoricManager()
    
    init() {
        loadGameMatches()
    }
    
    func addGameMatch(_ gameMatch: GameMatch) {
        gameMatches.append(gameMatch)
    }
    
    func saveGameMatches() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(gameMatches) {
            UserDefaults.standard.set(encodedData, forKey: "gameMatches")
        }
    }

    func loadGameMatches() {
        guard let gameMatchData = UserDefaults.standard.data(forKey: "gameMatches"),
              let gameMatches = try? JSONDecoder().decode([GameMatch].self, from: gameMatchData) else {
            return
        }
        self.gameMatches = gameMatches
    }
}
