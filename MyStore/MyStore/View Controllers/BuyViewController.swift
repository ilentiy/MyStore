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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension
extension BuyViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
