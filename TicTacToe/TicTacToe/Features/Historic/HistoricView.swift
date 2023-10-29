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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = "HistoricView.historicTitle"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
    func updatePlayerNames(playerOne: String, playerTwo: String, date: Date, cell: UITableViewCell) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy. HH:mm"
        let formattedDate = dateFormatter.string(from: date)
        
        cell.textLabel?.text = "🏆 \(playerOne) vs \(playerTwo)"
        cell.textLabel?.font = UIFont.sFProText(ofSize: 17, weight: .bold)
        cell.detailTextLabel?.text = formattedDate
        
        let playerOneColor: UIColor = DesignSystem.Colors.tertiary
        let playerTwoColor: UIColor = DesignSystem.Colors.accent
        
        if let attributedText = cell.textLabel?.text {
            let attributedString = NSMutableAttributedString(string: attributedText)
            
            let rangeOfPlayerOne = (attributedText as NSString).range(of: playerOne)
            attributedString.addAttributes([.foregroundColor: playerOneColor], range: rangeOfPlayerOne)
            
            let rangeOfPlayerTwo = (attributedText as NSString).range(of: playerTwo)
            attributedString.addAttributes([.foregroundColor: playerTwoColor], range: rangeOfPlayerTwo)
            
            cell.textLabel?.attributedText = attributedString
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
}

// MARK: - Delegate
extension HistoricView: UITableViewDelegate {}
