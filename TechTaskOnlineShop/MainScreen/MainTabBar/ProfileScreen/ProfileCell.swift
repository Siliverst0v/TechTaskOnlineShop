//
//  ProfileCell.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit

final class ProfileCell: UITableViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
    
    let cellImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .black
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Title label"
        label.font = .montserratRegular14
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
        addSubviews([
            cellImageView,
            titleLabel
        ])
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 40),
            cellImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension ProfileCell {
    func configure(with viewModel: ProfileViewModelType, for indexPath: IndexPath) {
        let cell = viewModel.getProfileCellViewModel(for: indexPath)
        cellImageView.image = UIImage(named: cell.image)
        titleLabel.text = cell.title
        switch cell.accessoryView {
        case .indicator:
            let image = UIImage(named: "DisclosureIndicator")
            let customIndocator = UIImageView(image: image)
            self.accessoryView = customIndocator
        case .balance:
            let label = UILabel()
            label.text = "$ 1593"
            label.font = .montserratRegular14
            label.sizeToFit()
            self.accessoryView = label
        case .none:
            self.accessoryType = .none
        }
    }
}
