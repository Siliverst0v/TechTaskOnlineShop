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
        homeViewController.coordinator = self
        navigationController.setViewControllers([homeViewController], animated: true)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func showDetailsViewController() {
        let detailsViewModel = FlashSaleDetailsViewModel()
        let detailsViewController = FlashSaleDetailsViewController(viewModel: detailsViewModel)
        navigationController.pushViewController(detailsViewController, animated: true)
    }
}
