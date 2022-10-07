//
//  ViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

final class SearchViewController: UIViewController {
    
    enum Constants {
        static let placeholderText = "Поиск по продуктам и магазинам"
        static let recentlyText = "Недавно просмотренные"
        static let clearButtonTitle = "Очистить"
        static let requestsText = "Варианты запросов"
        static let blackCaseInfo = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let blackCaseImage = "caseBlack1"
        static let brownCaseInfo = "Кожанный чехол Incase Flat для MacBook Pro 16 дюймов, золотой"
        static let brownCaseImage = "caseBrown1"
        static let watchInfo = "Спортивный ремешок Black Unity"
        static let watchImage = "clock1"
        static let requestOne = "AirPods"
        static let requestTwo = "AppleCare"
        static let requestThree = "Beats"
        static let requestFour = "Сравните модели iPhone"
    }
    
    // MARK: - Visual Components
    lazy var searchBar: UISearchController = {
        let searchBar = UISearchController()
        searchBar.obscuresBackgroundDuringPresentation = true
        searchBar.searchBar.placeholder = Constants.placeholderText
        return searchBar
    }()
    
    lazy var recentlyLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 200, width: view.frame.width - 40, height: 50))
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = Constants.recentlyText
        return label
    }()
    
    lazy var clearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 290, y: 200, width: 100, height: 50))
        button.setTitle(Constants.clearButtonTitle, for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var requestsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 460, width: view.frame.width - 40, height: 50))
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = Constants.requestsText
        return label
    }()
    
    lazy var blackCaseView: UIView = {
        let view =  createproductView(x: 10, y: 260)
        view.tag = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        let label = createProductLabel(text: Constants.blackCaseInfo)
        let imageView = createProductImage(named: Constants.blackCaseImage)
        view.addSubview(label)
        view.addSubview(imageView)
        return view
    }()
    
    lazy var brownCaseView: UIView = {
        let view =  createproductView(x: 330, y: 260)
        view.tag = 1
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        let label = createProductLabel(text: Constants.brownCaseInfo)
        let imageView = createProductImage(named: Constants.brownCaseImage)
        view.addSubview(label)
        view.addSubview(imageView)
        return view
    }()
    
    lazy var watchView: UIView = {
        let view =  createproductView(x: 170, y: 260)
        view.tag = 2
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        let label = createProductLabel(text: Constants.watchInfo)
        let imageView = createProductImage(named: Constants.watchImage)
        view.addSubview(label)
        view.addSubview(imageView)
        return view
    }()
    
    lazy var requestOneView: UIView = {
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
        label.text = Constants.requestOne
        
        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: "ElementColor")
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    lazy var requestTwoView: UIView = {
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
        label.text = Constants.requestTwo

        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: "ElementColor")
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    lazy var requestThreeView: UIView = {
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
        label.text = Constants.requestThree

        let lineView = UIView(frame: CGRect(x: 0, y: view.frame.height - 2, width: view.frame.width, height: 1))
        lineView.backgroundColor = UIColor(named: "ElementColor")
        
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(lineView)
        return view
    }()
    
    lazy var requestFourView: UIView = {
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
        label.text = Constants.requestFour

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
// extension
extension SearchViewController {
    
    // MARK: - Methods
    func setupUI() {
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
    
    func createproductView(x xCoordinate: Int, y yCoordinate: Int) -> UIView {
        let view = UIView(frame: CGRect(x: xCoordinate, y: yCoordinate, width: 140, height: 180))
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "ElementColor")
        return view
    }
    
    func createProductLabel(text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 10, y: 115, width: 120, height: 60))
        label.textColor = .label
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = text
        return label
    }

    func createProductImage(named imageName: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 25, y: 20, width: 90, height: 90))
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    @objc func tapAction(sender: UITapGestureRecognizer) {
        let productViewController = ProductViewController()
        switch sender.view?.tag {
        case 0:
            productViewController.nameProductLabel.text = Constants.blackCaseInfo
            productViewController.productImageView.image = UIImage(named: Constants.blackCaseImage)
        case 1:
            productViewController.nameProductLabel.text = Constants.brownCaseInfo
            productViewController.productImageView.image = UIImage(named: Constants.brownCaseImage)
        case 2:
            productViewController.nameProductLabel.text = Constants.watchInfo
            productViewController.productImageView.image = UIImage(named: Constants.watchImage)
        default:
            print("Error")
        }
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(productViewController, animated: true)
    }
}
