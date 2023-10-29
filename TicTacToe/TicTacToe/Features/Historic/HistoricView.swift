//
//  HistoricView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol HistoricViewDelegate: AnyObject {
    func numberOfRows(in tableView: UITableView, section: Int) -> Int
    func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

class HistoricView: UIView {
    weak var delegate: HistoricViewDelegate?
    
    private lazy var historicTitle: UILabel = {
        let label = UILabel()
        label.text = "Histórico"
        label.textColor = .black
        label.font = UIFont.sFProText(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "HistoricView.historicTitle"
        return label
    }()
    
    lazy var historicTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.reloadData()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = "HistoricView.historicTitle"
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
// MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
extension HistoricView {
    private func configureSubviews(){
        addSubview(historicTitle)
        addSubview(historicTableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            historicTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            historicTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            historicTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
            
            historicTableView.topAnchor.constraint(equalTo: historicTitle.bottomAnchor, constant: 16),
            historicTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            historicTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            historicTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
}

// MARK: - Actions
extension HistoricView {
    func updatePlayerNames(playerOne: PlayerEntity, playerTwo: PlayerEntity, date: Date, cell: CustomTableViewCell) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy. HH:mm"
        let formattedDate = dateFormatter.string(from: date)
        
        if playerOne.winner {
            cell.playerNameLabel.text = "🏆 \(playerOne.player) vs \(playerTwo.player)"
        } else {
            cell.playerNameLabel.text = "\(playerOne.player) vs \(playerTwo.player) 🏆"
        }
        cell.dateLabel.text = formattedDate
        
        let playerOneColor: UIColor = DesignSystem.Colors.tertiary
        let playerTwoColor: UIColor = DesignSystem.Colors.accent
        
        if let attributedText = cell.playerNameLabel.text {
            let attributedString = NSMutableAttributedString(string: attributedText)
            
            let rangeOfPlayerOne = (attributedText as NSString).range(of: playerOne.player)
            attributedString.addAttributes([.foregroundColor: playerOneColor], range: rangeOfPlayerOne)
            
            let rangeOfPlayerTwo = (attributedText as NSString).range(of: playerTwo.player)
            attributedString.addAttributes([.foregroundColor: playerTwoColor], range: rangeOfPlayerTwo)
            
            cell.playerNameLabel.attributedText = attributedString
        }
    }
}

// MARK: - DataSource
extension HistoricView:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfRows(in: tableView, section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return delegate?.cellForRowAt(tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
