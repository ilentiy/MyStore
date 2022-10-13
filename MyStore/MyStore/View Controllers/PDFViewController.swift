//
//  PDFViewController.swift
//  MyStore
//
//  Created by Илья on 11.10.2022.
//

import UIKit
import WebKit

/// Контроллер показывающий пдф файл
final class PDFViewController: UIViewController {

    // MARK: - Visual Components
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.frame)
        webView.load(request)
        return webView
    }()
    
    private lazy var doneButtonItem = UIBarButtonItem(systemItem: .close)
    
    // MARK: - Public Property
    var request: URLRequest!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension добавляет методы
extension PDFViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
    }
}
