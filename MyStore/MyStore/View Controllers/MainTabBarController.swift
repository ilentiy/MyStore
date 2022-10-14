//
//  TabBarController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Main Tab Bar
final class MainTabBarController: UITabBarController {
    enum Titles {
        static let buy = "Купить"
        static let forYou = "Для вас"
        static let search = "Поиск"
        static let basket = "Корзина"
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(named: Colors.element)
        setupViewControllers()
    }
    
    // MARK: - Private Methods
    private func setupViewControllers() {
        
        viewControllers = [
            createNavigationController(for: BuyViewController(),
                                       title: Titles.buy,
                                       image: UIImage(systemName: SystemImageNames.laptop)),
            createNavigationController(for: ForYouViewController(),
                                       title: Titles.forYou,
                                       image: UIImage(systemName: SystemImageNames.person)),
            createNavigationController(for: SearchViewController(),
                                       title: Titles.search,
                                       image: UIImage(systemName: SystemImageNames.magnifyingGlass)),
            createNavigationController(for: BasketViewController(),
                                       title: Titles.basket,
                                       image: UIImage(systemName: SystemImageNames.bag))
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
