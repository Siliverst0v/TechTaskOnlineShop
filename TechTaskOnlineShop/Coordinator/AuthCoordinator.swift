//
//  AuthCoordinator.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 17.03.2023.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var appCoordinator: Coordinator
    
    init(navigationController: UINavigationController, appCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.appCoordinator = appCoordinator
    }
    
    func start() {
        let registrationViewController = RegistrationViewController(viewModel: RegistrationViewModel())
        registrationViewController.delegate = self
        self.navigationController.setViewControllers([registrationViewController], animated: true)
    }
}

extension AuthCoordinator: RegistrationControllerDelegate {
    
    func showMainTabBarScreen() {
        let mainCoordinator = MainCoordinator(navigationController: self.navigationController, appCoordinator: appCoordinator)
        mainCoordinator.start()
    }
    
    func showLoginScreen() {
        let loginViewController = LoginViewController(viewModel: LoginViewModel())
        loginViewController.delegate = self
        self.navigationController.setViewControllers([loginViewController], animated: true)
    }
}

extension AuthCoordinator: LoginViewControllerDelegate {}
