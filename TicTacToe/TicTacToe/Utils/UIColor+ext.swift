//
//  UIColor+ect.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 26/10/23.
//

import UIKit

extension UIColor {

    convenience init(hex: String) {
        var cleanedHex = hex
        if hex.hasPrefix("#") {
            cleanedHex = String(hex.dropFirst())
        }
        guard cleanedHex.count == 6 else {
            self.init(white: 0, alpha: 1)
            return
        }
        var rgbValue: UInt64 = 0
        guard Scanner(string: cleanedHex).scanHexInt64(&rgbValue) else {
            self.init(white: 0, alpha: 1)
            return
        }
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
