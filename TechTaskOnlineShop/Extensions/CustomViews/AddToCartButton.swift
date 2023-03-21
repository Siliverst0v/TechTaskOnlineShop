//
//  AddToCartButton.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 19.03.2023.
//

import UIKit

final class AddToCartButton: UIButton {
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .addToCartSumLabelTextColor
        label.font = .montserratRegular10
        return label
    }()
    
    let addLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .montserratSemiBold8
        label.text = "ADD TO CART"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupView() {
        backgroundColor = .customSystemColor
    }
    
    func setupLayout() {
        addSubviews([sumLabel, addLabel])
        
        NSLayoutConstraint.activate([
        
            sumLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            sumLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 29),
            sumLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            
            addLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            addLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            addLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
    }
}
