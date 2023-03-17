//
//  SceneDelegate.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 13.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        appCoordinator = AppCoordinator(navigationController: self.window?.rootViewController as? UINavigationController ?? UINavigationController())
        appCoordinator?.start()
        window?.makeKeyAndVisible()
    }

}

