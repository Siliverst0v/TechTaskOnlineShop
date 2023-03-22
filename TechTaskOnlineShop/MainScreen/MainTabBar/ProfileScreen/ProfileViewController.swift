//
//  UserInfoViewController.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit
import PhotosUI

protocol ProfileViewControllerDelegate: AnyObject {
    func showRegistrationScreen()
}

final class ProfileViewController: UIViewController {
    
    private var viewModel: ProfileViewModelType
    weak var coordinator: ProfileViewControllerDelegate?
    
    private var profileTableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .backgroundColor
        tableView.register(ProfileUserCell.self, forCellReuseIdentifier: ProfileUserCell.reuseIdentifier)
        tableView.register(ProfileUploadItemCell.self, forCellReuseIdentifier: ProfileUploadItemCell.reuseIdentifier)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.reuseIdentifier)
        return tableView
    }()
    
    init(viewModel: ProfileViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        setDelegates()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.backgroundColor
        let titleLabel = UILabel()
        titleLabel.text = Constants.profileTitle
        titleLabel.font = .montserratSemiBold17
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
    }
    
    private func setupHierarchy() {
        view.addSubview(profileTableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    private func setDelegates() {
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
    
    @objc private func changePhoto() {
        openPHPicker()
        
    }
}

//MARK: - TableView Delegate, DataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserCell.reuseIdentifier, for: indexPath) as? ProfileUserCell else {return UITableViewCell()}
            cell.configure(with: viewModel)
            cell.changePhotoButton.addTarget(self, action: #selector(changePhoto), for: .touchUpInside)
            self.viewModel.changeImageDelegate = cell
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUploadItemCell.reuseIdentifier, for: indexPath) as? ProfileUploadItemCell else {return UITableViewCell()}
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.reuseIdentifier, for: indexPath) as? ProfileCell else {return UITableViewCell()}
            cell.configure(with: viewModel, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? ProfileCell
        if cell?.titleLabel.text == Constants.logOut {
            UserDefaultsManager.userIsLoggedIn = false
            coordinator?.showRegistrationScreen()
            coordinator = nil
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return NumericalConstannts.userCellHeight
        } else if indexPath.row == 1 {
            return NumericalConstannts.uploadCellHeight
        } else {
            return NumericalConstannts.profileCellHeight
        }
    }
}

//MARK: - PHPicker Delegate
extension ProfileViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: .none)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                guard let image = image as? UIImage, error == nil else { return }
                DispatchQueue.main.async {
                    self.viewModel.newProfileImage = image
                }
            }
        }
    }
    
    func openPHPicker() {
        var phPickerConfig = PHPickerConfiguration(photoLibrary: .shared())
        phPickerConfig.selectionLimit = 1
        phPickerConfig.filter = PHPickerFilter.any(of: [.images])
        let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
        phPickerVC.delegate = self
        present(phPickerVC, animated: true)
    }
}

