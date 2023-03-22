//
//  DetailsLargeCollectionViewCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 21.03.2023.
//

import UIKit

final class DetailsLargeCell: UICollectionViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        return imageView
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
        imageView.image = nil
    }
    
    private func configureUI() {
        backgroundColor = .clear
    }
    
    private func setupLayout() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}

extension DetailsLargeCell {
    func configure(with productImage: UIImage) {
        self.imageView.image = productImage
    }
}
