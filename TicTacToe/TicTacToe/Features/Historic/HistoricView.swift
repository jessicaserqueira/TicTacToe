//
//  HistoricView.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class HistoricView: UIView {
    private lazy var historicTitle: UILabel = {
        let label = UILabel()
        label.text = "Histórico"
        label.textColor = .black
        label.font = UIFont.sFProText(ofSize: 34, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "HistoricView.historicTitle"
        return label
    }()
    
    private lazy var historicTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
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
            
        ])
    }
}

// MARK: - Actions
extension HistoricView {
    private func setupActions(){
        
    }
}

// MARK: - DataSource
extension HistoricView:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}

// MARK: - Delegate
extension HistoricView: UITableViewDelegate {}
