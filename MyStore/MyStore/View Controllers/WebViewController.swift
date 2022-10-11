//
//  WebViewController.swift
//  MyStore
//
//  Created by Илья on 10.10.2022.
//

import UIKit
import WebKit

/// Переходит на сайт магазина
final class WebViewController: UIViewController {
    
    // MARK: - Visual Components
    private var activityViewController: UIActivityViewController?
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.frame)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.load(request)
        return webView
    }()
    
    private lazy var webToolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: view.frame.height - 130,
                                              width: view.frame.width, height: 40))
        backButtonItem.isEnabled = true
        forwardButtonItem.isEnabled = true
        toolBar.items = [backButtonItem, forwardButtonItem, spacer,
                         progressButtonItem, spacer, refreshButtonItem, shareButtonItem]
        return toolBar
    }()
    
    private lazy var progressView = UIProgressView(progressViewStyle: .default)
    
    private lazy var backButtonItem = UIBarButtonItem(image: UIImage(systemName: BarButtonImageName.back),
                                                      style: .plain,
                                                      target: self,
                                                      action: #selector(goBackAction))
    
    private lazy var forwardButtonItem = UIBarButtonItem(image: UIImage(systemName: BarButtonImageName.forward),
                                                         style: .done,
                                                         target: self,
                                                         action: #selector(goForwardAction))
    
    private lazy var refreshButtonItem = UIBarButtonItem(image: UIImage(systemName: BarButtonImageName.reload),
                                                         style: .done,
                                                         target: self,
                                                         action: #selector(reloadAction))
    
    private lazy var shareButtonItem = UIBarButtonItem(image: UIImage(systemName: BarButtonImageName.share),
                                                       style: .done,
                                                       target: self,
                                                       action: #selector(shareURLAction))
    
    private lazy var spacer = UIBarButtonItem(systemItem: .flexibleSpace)
    
    private lazy var progressButtonItem = UIBarButtonItem(customView: progressView)
    
    // MARK: - Public Property
    var request: URLRequest!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

/// extension добавляет методы
extension WebViewController {
    
    // MARK: - Methods
    private func setupUI() {
        progressView.sizeToFit()
        progressView.progress = Float(webView.estimatedProgress)
        view.addSubview(webView)
        view.addSubview(webToolBar)
    }
    
    // MARK: - Actions
    @objc private func goBackAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }
    
    @objc private func goForwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
    
    @objc private func reloadAction() {
        webView.reload()
    }
    
    @objc private func shareURLAction() {
        activityViewController = UIActivityViewController(activityItems: [request.url?.absoluteString ?? ""],
                                                          applicationActivities: nil)
        guard let activityViewController = activityViewController else { return }
        present(activityViewController, animated: true)
    }
}

/// WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let url = navigationAction.request.url?.absoluteString else { return }
        if url.contains("re-store.ru") {
            decisionHandler(.allow )
        } else {
            decisionHandler(.cancel )
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButtonItem.isEnabled = webView.canGoBack
        forwardButtonItem.isEnabled = webView.canGoForward
    }
}

/// WKUIDelegate
extension WebViewController: WKUIDelegate {
    
}
