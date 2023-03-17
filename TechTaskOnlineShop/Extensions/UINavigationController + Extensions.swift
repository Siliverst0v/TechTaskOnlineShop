//
//  UINavigationController + Extensions.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationBar.tintColor = .black
    }
}

