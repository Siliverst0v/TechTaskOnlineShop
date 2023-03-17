//
//  CategoryCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratRegular8
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
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
        categoryImageView.image = nil
        titleLabel.text = nil
    }
    
    private func configureUI() {
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    private func setupLayout() {
        addSubviews([categoryImageView, titleLabel])
        
        NSLayoutConstraint.activate([
            
            categoryImageView.topAnchor.constraint(equalTo: topAnchor),
            categoryImageView.widthAnchor.constraint(equalToConstant: 42),
            categoryImageView.heightAnchor.constraint(equalToConstant: 38),
            categoryImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

extension CategoryCell {
    func configure(with cellModel: CategoryCellModel) {
        categoryImageView.image = UIImage(named: cellModel.image)
        titleLabel.text = cellModel.title
    }
}
