//
//  StartViewController.swift
//  MyStore
//
//  Created by Илья on 13.10.2022.
//

import UIKit

/// SDSD
class StartViewController: UIViewController {
    
    private let pageImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    lazy var subViews: [UIView] = [pageImageView, titleLabel, infoLabel]
    
    init(imageName: String, title: String, info: String) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .white

        pageImageView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.width)
        pageImageView.center.x = view.center.x
        
        pageImageView.image = UIImage(named: imageName)
        
        titleLabel.text = title
        titleLabel.frame = CGRect(x: 0, y: 575, width: view.bounds.width, height: 100)
        titleLabel.center.x = view.center.x
        titleLabel.alpha = 0
        infoLabel.text = info
        infoLabel.frame = CGRect(x: 0, y: 625, width: view.bounds.width - 75, height: 100)
        infoLabel.center.x = view.center.x
        infoLabel.alpha = 0

        for view in subViews {
            self.view.addSubview(view)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        endAnimate()
    }
    
    func startAnimate() {
        UILabel.animate(withDuration: 1.5) {
            self.titleLabel.alpha = 1
            self.infoLabel.alpha = 1
        }
    }
    
    func endAnimate() {
        titleLabel.alpha = 0
        infoLabel.alpha = 0
    }
}
