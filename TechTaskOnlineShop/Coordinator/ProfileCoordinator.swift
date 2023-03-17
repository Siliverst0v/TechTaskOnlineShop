//
//  ProfileCoordinator.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 17.03.2023.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var appCoordinator: Coordinator
        
    init(navigationController: UINavigationController, appCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.appCoordinator = appCoordinator
    }
    
    func start() {
        let profileViewController = ProfileViewController(viewModel: ProfileViewModel())
        profileViewController.delegate = self
        navigationController.setViewControllers([profileViewController], animated: true)
    }
    
    func finishMainFlow() {
        appCoordinator.childCoordinators.removeAll()
        appCoordinator.start()
    }
}

extension ProfileCoordinator: ProfileViewControllerDelegate {
    func showRegistrationScreen() {
        finishMainFlow()
    }
}
