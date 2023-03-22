//
//  DetailsCollectionViewCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 21.03.2023.
//

import UIKit

final class DetailsSmallCell: UICollectionViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } else {
                self.transform = .identity
            }
        }
    }
    
    private let imageView: UIImageView = {
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
        imageView.image = nil
    }
    
    private func configureUI() {
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = NumericalConstannts.homeCellsCornerRadius
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

extension DetailsSmallCell {
    func configure(with productImage: UIImage) {
        self.imageView.image = productImage
    }
}
