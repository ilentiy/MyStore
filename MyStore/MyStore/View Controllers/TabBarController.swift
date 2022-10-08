//
//  TabBarController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Main Tab Bar
final class MainTabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(named: "TabBarColor")
        setupViewControllers()
    }
    
    // MARK: - Private Methods
    private func setupViewControllers() {
        
        viewControllers = [
            createNavigationController(for: BuyViewController(),
                                       title: "Купить",
                                       image: UIImage(systemName: "laptopcomputer.and.iphone")),
            createNavigationController(for: ForYouViewController(),
                                       title: "Для вас",
                                       image: UIImage(systemName: "person.crop.circle")),
            createNavigationController(for: SearchViewController(),
                                       title: "Поиск",
                                       image: UIImage(systemName: "magnifyingglass")),
            createNavigationController(for: BasketViewController(),
                                       title: "Корзина",
                                       image: UIImage(systemName: "bag"))
        ]
    }
    
    private func createNavigationController(for rootViewController: UIViewController,
                                            title: String,
                                            image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
