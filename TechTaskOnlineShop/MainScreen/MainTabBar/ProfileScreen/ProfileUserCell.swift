//
//  ProfileUserCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 17.03.2023.
//

import UIKit

protocol ProfileImageChangeDelegate: AnyObject {
    func changeProfileImage(image: UIImage?)
}

final class ProfileUserCell: UITableViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    private lazy var profilePhotoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .montserratRegular8
        return button
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .montserratSemiBold17
        return label
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
        addSubview(profilePhotoView)
        contentView.addSubview(changePhotoButton)
        addSubview(nameLabel)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            profilePhotoView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            profilePhotoView.widthAnchor.constraint(equalToConstant: 60),
            profilePhotoView.heightAnchor.constraint(equalToConstant: 60),
            profilePhotoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            changePhotoButton.widthAnchor.constraint(equalToConstant: 60),
            changePhotoButton.heightAnchor.constraint(equalToConstant: 12),
            changePhotoButton.centerXAnchor.constraint(equalTo: profilePhotoView.centerXAnchor),
            changePhotoButton.topAnchor.constraint(equalTo: profilePhotoView.bottomAnchor, constant: 8),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42),
            nameLabel.topAnchor.constraint(equalTo: changePhotoButton.bottomAnchor, constant: 19),
            
        ])
    }
}

extension ProfileUserCell {
    func configure(with viewModel: ProfileViewModelType) {
        let cellModel = viewModel.getProfileUserCellViewModel()
        if let image = cellModel.image {
            profilePhotoView.image = image
        } else {
            profilePhotoView.image = UIImage(systemName: "person.circle")
        }
        nameLabel.text = cellModel.name
    }
}

extension ProfileUserCell: ProfileImageChangeDelegate {
    func changeProfileImage(image: UIImage?) {
        guard let image = image else {return}
        if let currentUser = UserDefaultsManager.currentUser {
            let decoder = JSONDecoder()
            if let decodedUser = try? decoder.decode(User.self, from: currentUser) {
                DataManager.shared.saveImage(image: image, for: decodedUser.firstName)
            }
        }
        self.profilePhotoView.image = image
        NotificationCenter.default.post(name: Notification.Name(Constants.userImageChanged), object: nil)
    }
}
