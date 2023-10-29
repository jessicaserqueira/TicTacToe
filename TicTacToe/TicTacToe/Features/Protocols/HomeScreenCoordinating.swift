//
//  HomeScreenCoordinating.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol HomeScreenCoordinating: AnyObject {
    func showBoardScreen(with game: Game)
    func showHisctoricView()
}
