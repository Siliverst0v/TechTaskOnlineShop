//
//  UIView + Extensions.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 13.03.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ subViews: [UIView]) {
        subViews.forEach { addSubview($0) }
    }
}
