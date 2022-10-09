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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension
extension BasketViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
