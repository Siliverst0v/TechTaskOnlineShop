//
//  MainCoordinator.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 16.03.2023.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController, appCoordinator: self)
        let mainCoordinator = MainCoordinator(navigationController: navigationController, appCoordinator: self)
        if UserDefaultsManager.userIsLoggedIn {
            childCoordinators.removeAll()
            childCoordinators.append(mainCoordinator)
            mainCoordinator.start()
        } else {
            childCoordinators.removeAll()
            childCoordinators.append(authCoordinator)
            authCoordinator.start()
        }
    }
}
