//
//  ProfileUploadItemCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 17.03.2023.
//

import UIKit

final class ProfileUploadItemCell: UITableViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private var uploadItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Upload item", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setImage(ImageConstants.uploadButtonImage, for: .normal)
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 80)
        button.backgroundColor = .customSystemColor
        button.titleLabel?.font = .montserratSemiBold14
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .backgroundColor
        selectionStyle = .none
    }
    
    private func setupHierarchy() {
        contentView.addSubview(uploadItemButton)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            uploadItemButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            uploadItemButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            uploadItemButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}
