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
    /// Информация о продуктах
    enum InfoProducts {
        static let blackCase = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let brownCase = "Кожанный чехол Incase Flat для MacBook Pro 16 дюймов, золотой"
        static let watchStrap = "Спортивный ремешок Black Unity"
    }
    
    /// Цена продуктов
    enum ProductPrice {
        static let blackCase = "3 900.00 руб."
        static let brownCase = "5 600.00 руб."
        static let watchStrap = "4 000.00 руб."
    }
    
    /// Имена изображений продуктов
    enum ProductsImagesName {
        static let blackCase = ["caseBlack1", "caseBlack2", "caseBlack3"]
        static let brownCase = ["caseBrown1", "caseBrown2", "caseBrown3"]
        static let watchStrap = ["watchStrap1", "watchStrap2"]
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
        button.setTitle(TitleButtons.clear, for: .normal)
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
                                    imagesName: ProductsImagesName.blackCase),
                            Product(name: InfoProducts.watchStrap,
                                    price: ProductPrice.watchStrap,
                                    imagesName: ProductsImagesName.watchStrap),
                            Product(name: InfoProducts.brownCase,
                                    price: ProductPrice.brownCase,
                                    imagesName: ProductsImagesName.brownCase)
    
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension добавляет методы 
extension SearchViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
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
