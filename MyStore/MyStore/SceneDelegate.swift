//
//  SceneDelegate.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        let tabBarController = MainTabBarController()
        tabBarController.selectedViewController = tabBarController.viewControllers?[1]
        tabBarController.viewControllers?[1].overrideUserInterfaceStyle = .light
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
