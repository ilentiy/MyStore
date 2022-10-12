//
//  BuyViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Экран покупки
final class BuyViewController: UIViewController {
    
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
extension BuyViewController {
    
    // MARK: - Private Methods
    private func setupUserInterfaceStyle() {
        tabBarController?.overrideUserInterfaceStyle = .dark
        tabBarController?.tabBar.overrideUserInterfaceStyle = .dark
    }
    
   private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
