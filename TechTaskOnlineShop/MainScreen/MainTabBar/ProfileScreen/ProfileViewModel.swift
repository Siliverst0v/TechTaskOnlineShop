//
//  UserInfoViewModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit

protocol ProfileViewModelType {
    var changeImageDelegate: ProfileImageChangeDelegate? {get set}
    var profileCells: [ProfileCellModel] { get }
    var newProfileImage: UIImage? { get set }
    func getNumberOfRows() -> Int
    func getProfileUserCellViewModel() -> ProfileUserCellModel
    func getProfileCellViewModel(for indexPath: IndexPath) -> ProfileCellModel
}

final class ProfileViewModel: ProfileViewModelType {
    
    var changeImageDelegate: ProfileImageChangeDelegate?
    
    var profileCells = ProfileCellModel.cells
    var newProfileImage: UIImage? {
        didSet {
            changeImageDelegate?.changeProfileImage(image: newProfileImage)
        }
    }
    
    func getNumberOfRows() -> Int {
        profileCells.count + 2
    }
    
    func getProfileCellViewModel(for indexPath: IndexPath) -> ProfileCellModel {
        profileCells[indexPath.row - 2]
    }
    
    func getProfileUserCellViewModel() -> ProfileUserCellModel {
        let imageData = getUserImage()
        let userName = getUserName()
        return ProfileUserCellModel(name: userName, image: imageData)
    }
    
    private func getUserName() -> String {
        if let currentUser = UserDefaultsManager.currentUser {
            let decoder = JSONDecoder()
            if let decodedUser = try? decoder.decode(User.self, from: currentUser) {
                return decodedUser.firstName + " " + decodedUser.lastName
            }
        }
        return ""
    }
    
    func getUserImage() -> UIImage? {
        let defaultImage = UIImage(systemName: "person.circle")
        guard let encodedUser = UserDefaultsManager.currentUser else {return defaultImage}
        guard let user = try? JSONDecoder().decode(User.self, from: encodedUser)
        else {
            return defaultImage
        }
        return DataManager.shared.getImage(from: user.firstName)
    }
}
