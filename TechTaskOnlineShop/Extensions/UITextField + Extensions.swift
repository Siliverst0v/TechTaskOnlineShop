//
//  UITextField + Extensions.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit

let button = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle(){
        
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        button.tintColor = .black
        rightView = button
        rightViewMode = .always
        button.alpha = 0.5
    }
    
    func addSearchImage() {
        button.setImage(UIImage(named: "Search"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.tintColor = .black
        rightView = button
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }
}
