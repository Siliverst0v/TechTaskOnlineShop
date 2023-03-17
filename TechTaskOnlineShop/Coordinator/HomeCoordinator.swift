//
//  HomeCoordinator.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 17.03.2023.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController(viewModel: HomeViewModel())
        homeViewController.delegate = self
        navigationController.setViewControllers([homeViewController], animated: true)
    }
    
}

extension HomeCoordinator: HomeViewControllerDelegate {
    
}
