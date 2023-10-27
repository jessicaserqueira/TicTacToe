//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import UIKit

class BoardViewController: UIViewController {
    var viewModel: BoardViewModel
    var customView = BoarView()
    
    // MARK: - Initializer
    init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
         view = customView
         customView.delegate = self
         view.backgroundColor = DesignSystem.Colors.background

         if let boardSize = viewModel.boardSize, let playerOneName = viewModel.playerOneName, let playerTwoName = viewModel.playerTwoName {
             customView.updateBoardSize(with: boardSize)
             customView.updatePlayerNames(playerOne: playerOneName, playerTwo: playerTwoName)
         }
        
         viewModel.resetGame()
     }
}

// MARK: - Delegates
extension BoardViewController: BoardViewDelegate {
    func didSelectField(at row: Int, column: Int) {
     
    }
}
