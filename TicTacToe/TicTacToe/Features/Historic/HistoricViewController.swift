//
//  HistoricViewController.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class HistoricViewController: UIViewController {
    var customView = HistoricView()
    var viewModel: HistoricViewModel
    
    init(viewModel: HistoricViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.delegate = self
        view.backgroundColor = DesignSystem.Colors.background
        
    }
}

//MARK: - Delegate
extension HistoricViewController: HistoricViewDelegate {
    func numberOfRows(in tableView: UITableView, section: Int) -> Int {
        return viewModel.gameMatches.count
    }
    
    func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        let gameMatch = viewModel.gameMatches[indexPath.row]
        customView.updatePlayerNames(playerOne: gameMatch.playerOne, playerTwo: gameMatch.playerTwo, date: gameMatch.date, cell: cell)
        return cell
    }
}
