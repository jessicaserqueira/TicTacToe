//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//

import UIKit

class BoardViewViewController: UIViewController {
    var customView = BoarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        view.backgroundColor = DesignSystem.Colors.background
    }
}
