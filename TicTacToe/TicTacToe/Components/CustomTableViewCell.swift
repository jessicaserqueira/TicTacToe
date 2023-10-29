//
//  File.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 29/10/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let playerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sFProText(ofSize: 17, weight: .bold)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sFProText(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.layer.opacity = 0.6
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(playerNameLabel)
        contentView.addSubview(dateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
