//
//  CustomSegmentedControl.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func segmentedControl(_ segmentedControl: CustomUISegmentedControl, didSelectSegmentAtIndex index: Int)
}

class CustomUISegmentedControl: UISegmentedControl {
    
    weak var delegate: CustomSegmentedControlDelegate?
    
    init(segmentTitles: [String], selectedSegmentIndex: Int, accessibilityIdentifier: String) {
        super.init(items: segmentTitles)

        self.selectedSegmentIndex = selectedSegmentIndex
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = accessibilityIdentifier
        
        addTarget(self, action: #selector(segmentTapped), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func segmentTapped() {
        delegate?.segmentedControl(self, didSelectSegmentAtIndex: selectedSegmentIndex)
    }
}
