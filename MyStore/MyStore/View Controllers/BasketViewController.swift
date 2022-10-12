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
    override func viewWillAppear(_ animated: Bool) {
        setupUserInterfaceStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
