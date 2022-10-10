//
//  ViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

/// Экран поиска
final class SearchViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let placeholderText = "Поиск по продуктам и магазинам"
        static let recentlyText = "Недавно просмотренные"
        static let clearButtonTitle = "Очистить"
        static let requestsText = "Варианты запросов"
        static let blackCaseInfoText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let blackCaseImageName = "caseBlack1"
        static let brownCaseInfoText = "Кожанный чехол Incase Flat для MacBook Pro 16 дюймов, золотой"
        static let brownCaseImageName = "caseBrown1"
        static let watchInfoText = "Спортивный ремешок Black Unity"
        static let watchImageName = "clock1"
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
        button.setTitle(Constants.clearButtonTitle, for: .normal)
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
    
    private lazy var blackCaseView: UIView = {
        let view =  createproductView(x: 10, y: 260)
        view.tag = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        let label = createProductLabel(text: Constants.blackCaseInfoText)
        let imageView = createProductImage(named: Constants.blackCaseImageName)
        view.addSubview(label)
        view.addSubview(imageView)
        return view
    }()
    
    private lazy var brownCaseView: UIView = {
        let view =  createproductView(x: 330, y: 260)
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        let label = createProductLabel(text: Constants.brownCaseInfoText)
        let imageView = createProductImage(named: Constants.brownCaseImageName)
        view.addSubview(label)
        view.addSubview(imageView)
        return view
    }()
    
    private lazy var watchView: UIView = {
        let view =  createproductView(x: 170, y: 260)
        view.tag = 2
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        let label = createProductLabel(text: Constants.watchInfoText)
        let imageView = createProductImage(named: Constants.watchImageName)
        view.addSubview(label)
        view.addSubview(imageView)
        return view
    }()
    
    private lazy var requestOneView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 500, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestOneText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: "ElementColor")
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    private lazy var requestTwoView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 550, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestTwoText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: "ElementColor")
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    private lazy var requestThreeView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 600, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestThreeText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: "ElementColor")
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    private lazy var requestFourView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 650, width: view.frame.width - 40, height: 50))
        view.backgroundColor = .clear
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 15, width: 20, height: 20))
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .placeholderText
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(frame: CGRect(x: 30, y: 0,
                                          width: view.frame.width - view.frame.height,
                                          height: view.frame.height))
        label.textColor = .label
        label.text = Constants.requestFourText
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: "ElementColor")
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension
extension SearchViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(recentlyLabel)
        view.addSubview(clearButton)
        view.addSubview(requestsLabel)
        view.addSubview(blackCaseView)
        view.addSubview(brownCaseView)
        view.addSubview(watchView)
        view.addSubview(requestOneView)
        view.addSubview(requestTwoView)
        view.addSubview(requestThreeView)
        view.addSubview(requestFourView)
        navigationItem.searchController = searchBar
    }
    
    private func createproductView(x xCoordinate: Int, y yCoordinate: Int) -> UIView {
        let view = UIView(frame: CGRect(x: xCoordinate, y: yCoordinate, width: 140, height: 180))
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "ElementColor")
        return view
    }
    
    private func createProductLabel(text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 10, y: 115, width: 120, height: 60))
        label.textColor = .label
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = text
        return label
    }
    
    private func createProductImage(named imageName: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 25, y: 20, width: 90, height: 90))
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    @objc private func tapAction(sender: UITapGestureRecognizer) {
        let productViewController = ProductViewController()
        switch sender.view?.tag {
        case 0:
            productViewController.nameProductLabel.text = Constants.blackCaseInfoText
            productViewController.productImageView.image = UIImage(named: Constants.blackCaseImageName)
        case 1:
            productViewController.nameProductLabel.text = Constants.brownCaseInfoText
            productViewController.productImageView.image = UIImage(named: Constants.brownCaseImageName)
        case 2:
            productViewController.nameProductLabel.text = Constants.watchInfoText
            productViewController.productImageView.image = UIImage(named: Constants.watchImageName)
        default:
            break
        }
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(productViewController, animated: true)
    }
}
