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
        viewModel.delegate = self
        view.backgroundColor = DesignSystem.Colors.background
        
        if let boardSize = viewModel.boardSize {
            customView.updateBoardSize(with: boardSize)
        }
    }
}

// MARK: - Delegates
extension BoardViewController: BoardViewDelegate {
    func didSelectField(playerOne: String, playerTwo: String, at row: Int, column: Int) {
        if let playerOneName = viewModel.playerOneName, let playerTwoName = viewModel.playerTwoName {
            viewModel.makeMove(row: row, column: column)
            customView.updatePlayerNames(playerOne: playerOneName, playerTwo: playerTwoName, at: row, column: column)
        }
    }
}

// MARK: - Delegates
extension BoardViewController: BoardViewModelDelegate {
    func showWinMessage(winner: String) {
        let alert = UIAlertController(title: "Vitória!", message: "\(winner) venceu o jogo!", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             present(alert, animated: true, completion: nil)
    }
    
    func showDrawMessage() {
        let alert = UIAlertController(title: "Empate!", message: "O jogo empatou!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
    }
    
    func switchPlayerLabel(player: String) {
        customView.namePlayerTitle.text = player
    }
    
    func setButtonImages(forPlayer: Int, at row: Int, column: Int) {
        customView.setButtonImages(forPlayer: forPlayer, at: row, column: column)
    }
}
