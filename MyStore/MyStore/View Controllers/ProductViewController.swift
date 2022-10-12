//
//  ProductViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit
import WebKit

/// Карточка продукта
final class ProductViewController: UIViewController {
    
    // MARK: - Visual Components
    private lazy var nameProductLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 40))
        label.textColor = .label
        label.text = product?.name
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var priceProductLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 145, width: view.frame.width, height: 20))
        label.center.x = view.center.x
        label.textColor = .systemGray2
        label.text = product?.price
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var infoProductLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 455, width: view.frame.width, height: 40))
        label.center.x = view.center.x
        label.textColor = .systemGray2
        label.text = product?.name
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private lazy var whiteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 535, width: 35, height: 35))
        button.center.x = view.center.x - 23.5
        
        var config = UIButton.Configuration.borderless()
        config.cornerStyle = .capsule
        config.background.strokeColor = .systemBackground
        config.background.strokeWidth = 4
        config.background.backgroundColor = .lightGray
        button.configuration = config
        
        button.layer.cornerRadius = 17.5
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector (changeSelectedButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var gradientButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 535, width: 35, height: 35))
        button.center.x = view.center.x + 23.5
        
        var config = UIButton.Configuration.borderless()
        config.cornerStyle = .capsule
        config.background.strokeColor = .systemBackground
        config.background.strokeWidth = 4
        config.background.backgroundColor = .systemGray5
        button.configuration = config
        
        button.layer.cornerRadius = 17.5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.tintColor.cgColor
        button.isSelected = true
        button.addTarget(self, action: #selector (changeSelectedButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var addBasketButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 5, y: 665, width: view.frame.width - 10, height: 40))
        button.center.x = view.center.x
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.setTitle(ButtonsTitle.addBasket, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    private lazy var compatibleProductLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 620, width: 270, height: 20))
        label.center.x = view.center.x
        label.textColor = .systemGray2
        let attributedString = NSMutableAttributedString(string: LabelTexts.compatible)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: UIColor.tintColor,
                                      range: NSRange(location: 13, length: 21))
        label.attributedText = attributedString
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 11, weight: .regular)
        
        let imageView = UIImageView(image: UIImage(systemName: SystemImageNames.check))
        imageView.tintColor = .green
        
        label.addSubview(imageView)
        return label
    }()
    
    private lazy var deliveryProductLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 740, width: view.frame.width - 70, height: 60))
        label.center.x = view.center.x
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 12, weight: .regular)
        let attributedString = NSMutableAttributedString(string: LabelTexts.delivery)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: UIColor.label,
                                      range: NSRange(location: 0, length: 42))
        
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: UIColor.tintColor,
                                      range: NSRange(location: 72, length: 45))
        
        attributedString.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.boldSystemFont(ofSize: 12),
                                      range: NSRange(location: 0, length: 42))
        label.attributedText = attributedString
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loadPDFAction)))
        return label
    }()
    
    private lazy var boxImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: SystemImageNames.box))
        imageView.frame = CGRect(x: 10, y: 750, width: 20, height: 20)
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    private lazy var  productImageScrollView = createProductView(imageNames: product?.imagesName ?? [])
    
    private lazy var shareBarButton = UIBarButtonItem(image: UIImage(systemName: SystemImageNames.share),
                                                      style: .plain,
                                                      target: self,
                                                      action: nil)
    
    private lazy var heartBarButton = UIBarButtonItem(image: UIImage(systemName: SystemImageNames.heart),
                                                      style: .plain,
                                                      target: self,
                                                      action: nil)
    
    // MARK: - Public Property
    var product: Product?
    
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
extension ProductViewController {
    
    // MARK: - Private Methods
    private func setupUserInterfaceStyle() {
        tabBarController?.overrideUserInterfaceStyle = .dark
        tabBarController?.tabBar.overrideUserInterfaceStyle = .dark
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameProductLabel)
        view.addSubview(priceProductLabel)
        view.addSubview(infoProductLabel)
        view.addSubview(productImageScrollView)
        view.addSubview(whiteButton)
        view.addSubview(gradientButton)
        view.addSubview(compatibleProductLabel)
        view.addSubview(deliveryProductLabel)
        view.addSubview(addBasketButton)
        view.addSubview(boxImageView)
        navigationItem.setRightBarButtonItems([heartBarButton, shareBarButton], animated: true)
    }
    
    private func createProductView(imageNames: [String]) -> UIScrollView {
        let scrollViewRect = CGRect(x: 0, y: 200, width: view.frame.width, height: 240 )
        let scrollView = UIScrollView(frame: scrollViewRect)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = true
        var imageViewRect = CGRect(x: 0, y: 20, width: view.frame.width, height: scrollViewRect.height - 80 )
        for (index, imageName) in imageNames.enumerated() {
            let imageView = newImageView(imageName: imageName, paramFrame: imageViewRect)
            imageViewRect.origin.x += imageViewRect.width
            if index == 0 {
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loadURLAction)))
            }
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollViewRect.width * CGFloat(imageNames.count), height: 240 )
        return scrollView
    }
    
    private func newImageView(imageName: String, paramFrame: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: paramFrame)
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    // MARK: - Actions
    @objc private func changeSelectedButtonAction(sender: UIButton) {
        if whiteButton === sender {
            gradientButton.isSelected.toggle()
            gradientButton.layer.borderColor = UIColor.clear.cgColor
            whiteButton.layer.borderColor = UIColor.tintColor.cgColor
        } else {
            whiteButton.isSelected.toggle()
            whiteButton.layer.borderColor = UIColor.clear.cgColor
            gradientButton.layer.borderColor = UIColor.tintColor.cgColor
        }
    }
    
    @objc func loadURLAction(sender: UITapGestureRecognizer) {
        guard let productURL = product?.url else { return }
        let request = URLRequest(url: productURL)
        let webViewController = WebViewController()
        webViewController.request = request
        present(webViewController, animated: true)
    }
    
    @objc func loadPDFAction(sender: UITapGestureRecognizer) {
        guard let url = Bundle.main.url(forResource: "file", withExtension: "pdf") else { return }
        let request = URLRequest(url: url)
        let pdfViewController = PDFViewController()
        pdfViewController.request = request
        navigationController?.pushViewController(pdfViewController, animated: true)        
    }
}

/// UIScrollViewDelegate
extension ProductViewController: UIScrollViewDelegate {}
