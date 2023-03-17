//
//  BrandCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import UIKit

final class BrandCell: UICollectionViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
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
        brandImageView.image = nil
    }
    
    private func configureUI() {
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    private func setupLayout() {
        addSubview(brandImageView)
        
        NSLayoutConstraint.activate([
            
            brandImageView.topAnchor.constraint(equalTo: topAnchor),
            brandImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            brandImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            brandImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}

extension BrandCell {
    func configure(with brandModel: BrandCellModel) {
        brandImageView.image = UIImage(named: brandModel.image)
    }
}
