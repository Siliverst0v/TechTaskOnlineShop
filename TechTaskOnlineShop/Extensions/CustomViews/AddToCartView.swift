//
//  AddToCartView.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 19.03.2023.
//

import UIKit

final class AddToCartView: UIView {
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quantity:"
        label.textColor = .detailsScreenTextColor
        label.font = .montserratRegular10
        return label
    }()
    
    let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(ImageConstants.minusImage, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.tintColor = .white
        button.backgroundColor = .customSystemColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(ImageConstants.miniPlusImage, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .customSystemColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    let addToCartButton: AddToCartButton = {
        let button = AddToCartButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customSystemColor
        button.layer.cornerRadius = 15
        return button
    }()

    init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .black
        layer.cornerRadius = 20
    }

    private func setupLayout() {
        addSubviews([quantityLabel, minusButton, plusButton, addToCartButton])

        NSLayoutConstraint.activate([
            
            quantityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            quantityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            quantityLabel.widthAnchor.constraint(equalToConstant: 50),
            
            minusButton.leadingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),
            minusButton.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 11),
            minusButton.heightAnchor.constraint(equalToConstant: 22),
            minusButton.widthAnchor.constraint(equalToConstant: 38),
            
            plusButton.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 20),
            plusButton.topAnchor.constraint(equalTo: minusButton.topAnchor),
            plusButton.heightAnchor.constraint(equalTo: minusButton.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor),
            
            addToCartButton.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
            addToCartButton.widthAnchor.constraint(equalToConstant: 170),
            addToCartButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

