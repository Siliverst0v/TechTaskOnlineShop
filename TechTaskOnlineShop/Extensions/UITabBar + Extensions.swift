//
//  UITabBar + Extensions.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 16.03.2023.
//

import UIKit

extension UITabBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeOfTab = super.sizeThatFits(size)
        sizeOfTab.height = 87
        return sizeOfTab
    }
}
