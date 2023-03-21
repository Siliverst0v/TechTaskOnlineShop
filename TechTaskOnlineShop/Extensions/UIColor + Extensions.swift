//
//  UIColor + Extensions.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 13.03.2023.
//

import UIKit

extension UIColor {
    static let textFieldColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
    static let backgroundColor = UIColor(red: 250/255, green: 249/255, blue: 255/255, alpha: 1)
    static let customSystemColor = UIColor(red: 78/255, green: 85/255, blue: 215/255, alpha: 1)
    static let tabBarActiveColor = UIColor(red: 238/255, green: 239/255, blue: 244/255, alpha: 1)
    static let searchBarBackground = UIColor(red: 245/255, green: 246/255, blue: 247/255, alpha: 1)
    static let favouriteShareTintColor = UIColor(red: 84/255, green: 85/255, blue: 137/255, alpha: 1)
    static let favouriteShareBackColor = UIColor(red: 229/255, green: 233/255, blue: 239/255, alpha: 1)
    static let detailsScreenTextColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
    static let addToCartSumLabelTextColor = UIColor(red: 153/255, green: 160/255, blue: 255/255, alpha: 1)
}

//MARK: - HEX to UIColor convert
extension UIColor {
    
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        let length = hexSanitized.count
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
