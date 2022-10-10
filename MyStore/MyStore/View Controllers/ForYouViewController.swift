//
//  ForYouViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Экран Для вас
final class ForYouViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension добавляет методы
extension ForYouViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
