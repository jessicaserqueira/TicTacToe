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
    
    lazy var namePlayerTitle: UILabel = {
        let labal = UILabel()
        labal.text = ""
        labal.textAlignment = .center
        labal.font = UIFont.sFProText(ofSize: 17, weight: .bold)
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal.accessibilityIdentifier = "BoarView.namePlayerTitle"
        return labal
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setupConstraints()
        setupActions()
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
        historicTableView.addSubview(namePlayerTitle)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            historicTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            historicTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            historicTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
            
            historicTableView.topAnchor.constraint(equalTo: historicTitle.bottomAnchor, constant: 16),
            historicTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            historicTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            historicTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            namePlayerTitle.leadingAnchor.constraint(equalTo: historicTableView.leadingAnchor, constant: 16),
            namePlayerTitle.trailingAnchor.constraint(equalTo: historicTableView.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - Actions
extension HistoricView {
    private func setupActions(){
        
    }
    func updatePlayerNames(playerOne: String, playerTwo: String) {
        namePlayerTitle.text = "🏆 \(playerOne) vs \(playerTwo)"
    
        let playerOneColor: UIColor = DesignSystem.Colors.tertiary
        let playerTwoColor: UIColor = DesignSystem.Colors.accent
        
        let attributedText = NSMutableAttributedString(string: namePlayerTitle.text ?? "")
        
        if let rangeOfPlayerOne = (namePlayerTitle.text as NSString?)?.range(of: playerOne) {
            attributedText.addAttributes([.foregroundColor: playerOneColor], range: rangeOfPlayerOne)
        }
        
        if let rangeOfPlayerTwo = (namePlayerTitle.text as NSString?)?.range(of: playerTwo) {
            attributedText.addAttributes([.foregroundColor: playerTwoColor], range: rangeOfPlayerTwo)
        }
        
        namePlayerTitle.attributedText = attributedText
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
