//
//  BasketViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Корзина товаров
final class BasketViewController: UIViewController {
    
    // MARK: - Life Cycle
<<<<<<< HEAD
=======
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUserInterfaceStyle()
    }
    
>>>>>>> 91b4718ea638d43d98ed089c8f208ddc3da98226
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUserInterfaceStyle()
    }
}

/// extension добавляет методы
extension BasketViewController {
    
    // MARK: - Private Methods
    private func setupUserInterfaceStyle() {
        tabBarController?.overrideUserInterfaceStyle = .dark
        tabBarController?.tabBar.overrideUserInterfaceStyle = .dark
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
