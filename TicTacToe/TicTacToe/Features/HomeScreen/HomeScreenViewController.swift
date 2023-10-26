//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 25/10/23.
//

import UIKit

class HomeScreenViewController: UIViewController {
    var viewModel: HomeScreenViewModel
    
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.Colors.secondary
    }
    
    func showBoardScreen(){
        if let coordinator = viewModel.coordinator {
            coordinator.showBoardScreen()
        }
    }
}
