//
//  PlayerButton.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 28/10/23.
//

import UIKit

class CustomPlayerButton: UIButton {
    lazy var playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imageName: String? {
        didSet {
            if let imageName = imageName, let image = UIImage(named: imageName) {
                playerImageView.image = image
            }
        }
    }

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - METHODS
extension CustomPlayerButton{
    private func setupUI() {
        addSubview(playerImageView)

        NSLayoutConstraint.activate([
            playerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            playerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            playerImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            playerImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        ])
    }
}
