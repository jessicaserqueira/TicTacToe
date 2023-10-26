//
//  UIFonts+ext.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

enum FontName: String {
    case regular = "SF-Pro-Text-Regular"
    case medium = "SF-Pro-Text-Medium"
    case bold = "SF-Pro-Text-Bold"
}

extension UIFont {
    static func roboto(ofSize size: CGFloat, weight: FontName) -> UIFont {
        var fontWeight: UIFont.Weight
        
        switch weight {
        case .regular:
            fontWeight = .regular
        case .medium:
            fontWeight = .medium
        case .bold:
            fontWeight = .bold
        }
        
        if let font = UIFont(name: weight.rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size, weight: fontWeight)
        }
    }
}
