//
//  SearchCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 16.03.2023.
//


import UIKit

final class SearchCell: UICollectionViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .montserratRegular10
        textField.textAlignment = .center
        textField.backgroundColor = .searchBarBackground
        textField.layer.cornerRadius = 12
        textField.tintColor = .black
        textField.addSearchImage()
        return textField
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
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    private func setupLayout() {
        addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            
            searchTextField.topAnchor.constraint(equalTo: topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}

extension SearchCell {
    func configure(with cellModel: SearchCellModel) {
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: cellModel.placeHolder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
    }
}
