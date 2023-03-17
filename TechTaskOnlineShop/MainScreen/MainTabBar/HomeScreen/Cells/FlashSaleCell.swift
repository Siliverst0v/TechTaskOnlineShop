//
//  FlashSaleCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import UIKit

final class FlashSaleCell: UICollectionViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private let flashSaleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold10
        label.textAlignment = .center
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.layer.masksToBounds = true
        label.backgroundColor = .red
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold8
        label.textAlignment = .center
        label.textColor = .black
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.backgroundColor = .systemGray5
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold14
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold8
        label.textColor = .white
        return label
    }()
    
    private let favouriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Heart"), for: .normal)
        button.tintColor = .darkGray
        button.layer.cornerRadius = 14
        button.backgroundColor = .lightGray.withAlphaComponent(0.8)
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Plus"), for: .normal)
        button.tintColor = .darkGray
        button.layer.cornerRadius = 17
        button.backgroundColor = .lightGray.withAlphaComponent(0.8)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        flashSaleImageView.image = nil
        categoryLabel.text = nil
        nameLabel.text = nil
        priceLabel.text = nil
    }
    
    private func configureUI() {
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    private func setupLayout() {
        addSubview(flashSaleImageView)
        insertSubview(categoryLabel, aboveSubview: flashSaleImageView)
        insertSubview(nameLabel, aboveSubview: flashSaleImageView)
        insertSubview(priceLabel, aboveSubview: flashSaleImageView)
        insertSubview(discountLabel, aboveSubview: flashSaleImageView)
        contentView.insertSubview(favouriteButton, aboveSubview: flashSaleImageView)
        contentView.insertSubview(addButton, aboveSubview: flashSaleImageView)
        
        NSLayoutConstraint.activate([
            
            flashSaleImageView.topAnchor.constraint(equalTo: topAnchor),
            flashSaleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            flashSaleImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            flashSaleImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            addButton.heightAnchor.constraint(equalToConstant: 35),
            addButton.widthAnchor.constraint(equalToConstant: 35),
            
            favouriteButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -5),
            favouriteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            favouriteButton.heightAnchor.constraint(equalToConstant: 28),
            favouriteButton.widthAnchor.constraint(equalToConstant: 28),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            priceLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: favouriteButton.leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -16),
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            categoryLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -7),
            categoryLabel.widthAnchor.constraint(equalToConstant: 50),
            categoryLabel.heightAnchor.constraint(equalToConstant: 17),
            
            discountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            discountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            discountLabel.widthAnchor.constraint(equalToConstant: 49),
            discountLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
    }
}

extension FlashSaleCell {
    func configure(with flashSaleModel: FlashSale) {
        nameLabel.text = flashSaleModel.name
        priceLabel.text = String(flashSaleModel.price)
        discountLabel.text = "\(flashSaleModel.discount)% off"
        categoryLabel.text = flashSaleModel.category
        
        DispatchQueue.global().async {
            guard let url = URL(string: flashSaleModel.imageURL), let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.flashSaleImageView.image = UIImage(data: data)
            }
        }
    }
}
