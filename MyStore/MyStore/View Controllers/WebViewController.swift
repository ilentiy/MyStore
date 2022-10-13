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
        guard let request = request else { return  webView }
        webView.load(request)
        return webView
    }()
    
    private lazy var webToolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: view.frame.height - 130,
                                              width: view.frame.width, height: 40))
        backButtonItem.isEnabled = true
        forwardButtonItem.isEnabled = true
        toolBar.items = [backButtonItem, spacer, forwardButtonItem, spacer,
                         progressButtonItem, spacer, refreshButtonItem, spacer, shareButtonItem]
        return toolBar
    }()
    
    private lazy var progressView = UIProgressView(progressViewStyle: .bar)
    
    private lazy var progressButtonItem = UIBarButtonItem(customView: progressView)
    
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
    
    private var observation: NSKeyValueObservation?
    
    // MARK: - Public Property
    var request: URLRequest?
    
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
        
        observation = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] _, _ in
            guard let self = self else { return }
            self.progressView.progress = Float(self.webView.estimatedProgress)
        }
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
        guard let absoluteString = request?.url?.absoluteString else { return }
        activityViewController = UIActivityViewController(activityItems: [absoluteString],
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
        if url.contains(ProductsURL.restore) {
            decisionHandler(.allow )
        } else {
            decisionHandler(.cancel )
        }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        backButtonItem.isEnabled = webView.canGoBack
        forwardButtonItem.isEnabled = webView.canGoForward
    }
}

/// WKUIDelegate
extension WebViewController: WKUIDelegate {}
