//
//  HeaderSupplementaryView.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import UIKit

final class HeaderSupplementaryView: UICollectionReusableView {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .montserratSemiBold17
        label.textColor = .black
        return label
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View all", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .montserratRegular10
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
    
    private func configureUI() {
        backgroundColor = .none
    }
    
    private func setupLayout() {
        addSubviews([headerLabel, viewAllButton])
        
        NSLayoutConstraint.activate([
            
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            viewAllButton.heightAnchor.constraint(equalToConstant: 8),
            viewAllButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
    }
}

extension HeaderSupplementaryView {
    func configure(sectionName: String) {
        headerLabel.text = sectionName
    }
}
