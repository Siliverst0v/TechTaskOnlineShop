//
//  MainCoordinator.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 17.03.2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var appCoordinator: Coordinator
    
    init(navigationController: UINavigationController, appCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.appCoordinator = appCoordinator
    }
    
    func start() {
        setTabBar()
    }
    
    func setTabBar() {
        let mainTabBarController = MainTabBarController()
        
        
        //MARK: - Home
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstants.homeTabBarImage,
            selectedImage: nil
        )
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        //MARK: - Profile
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstants.profileTabBarImage,
            selectedImage: nil
        )
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController, appCoordinator: appCoordinator)
        childCoordinators.append(profileCoordinator)
        profileCoordinator.start()
        
        //MARK: - Favourite
        let favouriteNavigationController = UINavigationController()
        favouriteNavigationController.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstants.favouriteTabBarImage,
            selectedImage: nil
        )
        
        //MARK: - Cart
        let cartNavigationController = UINavigationController()
        cartNavigationController.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstants.cartTabBarImage,
            selectedImage: nil
        )
        
        //MARK: - Chat
        let chatNavigationController = UINavigationController()
        chatNavigationController.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstants.chatTabBarImage,
            selectedImage: nil
        )
        
        mainTabBarController.setViewControllers([
            homeNavigationController,
            favouriteNavigationController,
            cartNavigationController,
            chatNavigationController,
            profileNavigationController
        ], animated: false)
        
        navigationController.setViewControllers([mainTabBarController], animated: false)
        navigationController.isNavigationBarHidden = true
    }
}
