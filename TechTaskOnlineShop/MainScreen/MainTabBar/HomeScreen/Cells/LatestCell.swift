//
//  LatestCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import UIKit

final class LatestCell: UICollectionViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private let latestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold6
        label.textAlignment = .center
        label.textColor = .black
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.backgroundColor = .systemGray5
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold10
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
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Plus"), for: .normal)
        button.tintColor = .darkGray
        button.layer.cornerRadius = 10
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
        latestImageView.image = nil
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
        addSubview(latestImageView)
        insertSubview(categoryLabel, aboveSubview: latestImageView)
        insertSubview(nameLabel, aboveSubview: latestImageView)
        insertSubview(priceLabel, aboveSubview: latestImageView)
        contentView.insertSubview(addButton, aboveSubview: latestImageView)
        
        NSLayoutConstraint.activate([
            
            latestImageView.topAnchor.constraint(equalTo: topAnchor),
            latestImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            latestImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            latestImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            addButton.heightAnchor.constraint(equalToConstant: 20),
            addButton.widthAnchor.constraint(equalToConstant: 20),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            priceLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 6),
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            categoryLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -33),
            categoryLabel.widthAnchor.constraint(equalToConstant: 35),
            categoryLabel.heightAnchor.constraint(equalToConstant: 12),
            
        ])
    }
}

extension LatestCell {
    func configure(with latestModel: Latest) {
        priceLabel.text = "$ \(latestModel.price)"
        nameLabel.text = latestModel.name
        categoryLabel.text = latestModel.category
        
        DispatchQueue.global().async {
            guard let url = URL(string: latestModel.imageURL), let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.latestImageView.image = UIImage(data: data)
            }
        }
    }
}
