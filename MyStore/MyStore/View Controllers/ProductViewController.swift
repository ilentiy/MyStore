//
//  ProductViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Карточка продукта
final class ProductViewController: UITabBarController {
    
    // MARK: - Visual Components
    lazy var nameProductLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 200,
                                                  width: view.frame.width,
                                                  height: view.frame.width * 0.6 ))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension
extension ProductViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameProductLabel)
        view.addSubview(productImageView)
        tabBar.isHidden = true
    }
}
