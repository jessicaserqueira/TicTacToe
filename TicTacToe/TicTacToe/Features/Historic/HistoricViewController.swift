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
        view.backgroundColor = DesignSystem.Colors.background
        
        customView.historicTableView.dataSource = self
        customView.historicTableView.reloadData()
    }
}

// MARK: - DataSource
extension HistoricViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.gameMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let gameMatch = viewModel.gameMatches[indexPath.row]
        cell.textLabel?.text = "🏆 \(String(describing: gameMatch.playerOne)) vs \(gameMatch.playerTwo)"
        return cell
    }
}
