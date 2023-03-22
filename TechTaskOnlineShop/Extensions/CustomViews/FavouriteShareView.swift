//
//  FavouriteShareView.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 19.03.2023.
//

import UIKit

final class FavouriteShareView: UIView {
    
    private let favouriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(ImageConstants.favouriteTabBarImage, for: .normal)
        return button
    }()

    private let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .favouriteShareTintColor
        return view
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(ImageConstants.shareImage, for: .normal)
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
        tintColor = .favouriteShareTintColor
        backgroundColor = .favouriteShareBackColor
        layer.cornerRadius = 15
    }

    private func setupLayout() {
        addSubviews([favouriteButton, divider, shareButton])

        NSLayoutConstraint.activate([
            favouriteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            favouriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            favouriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            divider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            divider.topAnchor.constraint(equalTo: favouriteButton.bottomAnchor, constant: 16),
            divider.heightAnchor.constraint(equalToConstant: 1),

            shareButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            shareButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 16),
            shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
