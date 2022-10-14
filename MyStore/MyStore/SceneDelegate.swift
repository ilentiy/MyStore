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
        let pageController = MainPageViewController(transitionStyle: .scroll,
                                                    navigationOrientation: .horizontal,
                                                    options: nil)
        if UserDefaults.standard.bool(forKey: Keys.firstLaunch) {
            window?.rootViewController = tabBarController
        } else {
            window?.rootViewController = pageController
        }
        window?.makeKeyAndVisible()
    }
}
