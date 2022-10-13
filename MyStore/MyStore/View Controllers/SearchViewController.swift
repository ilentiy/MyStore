//
//  ViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Экран поиска
final class SearchViewController: UIViewController {
    
    /// Константы
    enum Constants {
        static let placeholderText = "Поиск по продуктам и магазинам"
        static let recentlyText = "Недавно просмотренные"
        static let requestsText = "Варианты запросов"
        static let requestOneText = "AirPods"
        static let requestTwoText = "AppleCare"
        static let requestThreeText = "Beats"
        static let requestFourText = "Сравните модели iPhone"
    }
   
    // MARK: - Visual Components
    private lazy var searchBar: UISearchController = {
        let searchBar = UISearchController()
        searchBar.obscuresBackgroundDuringPresentation = true
        searchBar.searchBar.placeholder = Constants.placeholderText
        return searchBar
    }()
    
    private lazy var recentlyLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 200, width: view.frame.width - 40, height: 50))
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = Constants.recentlyText
        return label
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 290, y: 200, width: 100, height: 50))
        button.setTitle(ButtonsTitle.clear, for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var requestsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 460, width: view.frame.width - 40, height: 50))
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = Constants.requestsText
        return label
    }()
    
    private lazy var requestOneView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 500, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: SystemImageNames.magnifyingGlass)
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestOneText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: Colors.element)
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    private lazy var requestTwoView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 550, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: SystemImageNames.magnifyingGlass)
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestTwoText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: Colors.element)
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    private lazy var requestThreeView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 600, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: SystemImageNames.magnifyingGlass)
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestThreeText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: Colors.element)
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    private lazy var requestFourView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 650, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: SystemImageNames.magnifyingGlass)
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestFourText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: Colors.element)
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    private lazy var productScrollView = createProductScrollView(x: 0, y: 260)
    
    // MARK: - Private Property
    
    private let products = [Product(name: InfoProducts.blackCase,
                                    price: ProductPrice.blackCase,
                                    imagesName: ProductsImagesName.blackCase,
                                    url: URL(string: ProductsURL.blackCase)),
                            Product(name: InfoProducts.watchStrap,
                                    price: ProductPrice.watchStrap,
                                    imagesName: ProductsImagesName.watchStrap,
                                    url: URL(string: ProductsURL.watchStrap)),
                            Product(name: InfoProducts.brownCase,
                                    price: ProductPrice.brownCase,
                                    imagesName: ProductsImagesName.brownCase,
                                    url: URL(string: ProductsURL.brownCase))
    ]
    
    // MARK: - Life Cycle
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
extension SearchViewController {
    
    // MARK: - Private Methods
    private func setupUserInterfaceStyle() {
        tabBarController?.overrideUserInterfaceStyle = .dark
        tabBarController?.tabBar.overrideUserInterfaceStyle = .dark
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        tabBarController?.overrideUserInterfaceStyle = .dark
        tabBarController?.tabBar.overrideUserInterfaceStyle = .dark
        view.addSubview(recentlyLabel)
        view.addSubview(clearButton)
        view.addSubview(requestsLabel)
        view.addSubview(requestOneView)
        view.addSubview(requestTwoView)
        view.addSubview(requestThreeView)
        view.addSubview(requestFourView)
        view.addSubview(productScrollView)
        navigationItem.searchController = searchBar
    }
    
    private func newImageViewWithImage(imageName: String, paramFrame: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: paramFrame)
        let image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }
    
    private func createProductScrollView(x xCoordinate: CGFloat, y yCoordinate: CGFloat) -> UIScrollView {
        let scrollView = UIScrollView(frame: CGRect(x: xCoordinate,
                                                    y: yCoordinate,
                                                    width: view.bounds.width,
                                                    height: 180))
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = false
        
        var  productViewRect = CGRect(x: 0, y: 0, width: 140, height: scrollView.frame.height)
        
        for (index, product) in products.enumerated() {
            let productView =  createproductView(for: product, tag: index, frame: productViewRect)
            productViewRect.origin.x += productViewRect.width + 15
            scrollView.addSubview(productView)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 1.5, height: 180)
        return scrollView
    }
    
    private func createproductView(for product: Product, tag: Int, frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        let nameProductLabel = UILabel(frame: CGRect(x: 10, y: 115, width: 120, height: 60))
        let productImageView = UIImageView(frame: CGRect(x: 25, y: 20, width: 90, height: 90))
        let imageName = product.imagesName.first ?? ""
        view.tag = tag
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: Colors.element)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        
        nameProductLabel.textColor = .label
        nameProductLabel.numberOfLines = 3
        nameProductLabel.font = UIFont.boldSystemFont(ofSize: 13)
        nameProductLabel.text = product.name
        
        productImageView.image = UIImage(named: imageName)
        productImageView.contentMode = .scaleAspectFit
        
        view.addSubview(productImageView)
        view.addSubview(nameProductLabel)
        return view
    }
    
    // MARK: - Actions
    @objc private func tapAction(sender: UITapGestureRecognizer) {
        guard let selectView = sender.view,
              selectView.tag < products.count else { return }
        let productViewController = ProductViewController()
        productViewController.product = products[selectView.tag]
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(productViewController, animated: true)
    }
}

/// UIScrollViewDelegate
extension SearchViewController: UIScrollViewDelegate {}
