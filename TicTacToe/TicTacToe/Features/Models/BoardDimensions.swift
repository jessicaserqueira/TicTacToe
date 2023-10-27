//
//  Dimen.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

struct BoardDimensions {
    var width: Int
    var height: Int

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    var stringValue: String {
        return "\(width)x\(height)"
    }

    static let threeByThree = BoardDimensions(width: 3, height: 3)
    static let fourByFour = BoardDimensions(width: 4, height: 4)
    static let fiveByFive = BoardDimensions(width: 5, height: 5)
    static let sixBySix = BoardDimensions(width: 6, height: 6)
    static let sevenBySeven = BoardDimensions(width: 7, height: 7)
    static let eightByEight = BoardDimensions(width: 8, height: 8)
    static let nineByNine = BoardDimensions(width: 9, height: 9)
    static let tenByTen = BoardDimensions(width: 10, height: 10)
}
