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

/// extension
extension ForYouViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
