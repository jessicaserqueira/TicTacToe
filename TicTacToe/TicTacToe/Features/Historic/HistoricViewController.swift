//
//  HistoricViewController.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

class HistoricViewController: UIViewController {
    var customView = HistoricView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        view.backgroundColor = DesignSystem.Colors.background
    }
}
