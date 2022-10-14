//
//  MainPageViewController.swift
//  MyStore
//
//  Created by Илья on 13.10.2022.
//

import UIKit

///  Стартовая страница
final class MainPageViewController: UIPageViewController {
    
    // MARK: - Visual Components
    
    let skipButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 840, width: 100, height: 20))
        button.setTitle(PageButtonTitle.skip, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 290, y: 840, width: 100, height: 20))
        button.setTitle(PageButtonTitle.next, for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 840, width: 150, height: 20))
        button.setTitle(PageButtonTitle.start, for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.isHidden = true
        return button
    }()
    
    // MARK: - Private Property
    private let proxy = UIPageControl.appearance()
    private  var currentIndex = 0
    
    private let pages: [StartViewController] =  [
        StartViewController(imageName: Pages.First.imageName,
                            title: Pages.First.titleText,
                            info: Pages.First.infoText),
        
        StartViewController(imageName: Pages.Second.imageName,
                            title: Pages.Second.titleText,
                            info: Pages.Second.infoText),
        
        StartViewController(imageName: Pages.Third.imageName,
                            title: Pages.Third.titleText,
                            info: Pages.Third.infoText)
    ]
    
    // MARK: - Init
    init(transitionStyle: UIPageViewController.TransitionStyle,
         navigationOrientation: UIPageViewController.NavigationOrientation,
         options: [String: Any]?) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        setViewControllers([pages[0]], direction: .forward, animated: true)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configurate()
    }
    
    @objc func nextButtonAction() {
        guard
            let currentPage = viewControllers?.first,
            let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage)
        else { return }
        setViewControllers([nextPage], direction: .forward, animated: true)
    }
    
    @objc func startAction() {
        UserDefaults.standard.set(true, forKey: Keys.firstLaunch)
        
        let tabBarController = MainTabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
        
    }
}

/// добавить марку на эхстеншен
extension MainPageViewController {
    
    // MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .white
        startButton.center.x = view.center.x
        view.addSubview(startButton)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
    }
    
    private func configurate() {
        proxy.pageIndicatorTintColor = .darkGray
        proxy.currentPageIndicatorTintColor = .tintColor
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        self.delegate = self
        self.dataSource = self
    }
    
    private func checklastView(index: Int) {
        if index == pages.endIndex - 1 {
            skipButton.isHidden = true
            nextButton.isHidden = true
            startButton.isHidden = false
            hidePageControl(hidden: true)
        } else {
            skipButton.isHidden = false
            nextButton.isHidden = false
            startButton.isHidden = true
            hidePageControl(hidden: false)
        }
    }
    
    private func hidePageControl(hidden: Bool) {
        for subView in view.subviews where subView is UIPageControl {
            subView.isHidden = hidden
        }
    }
}

extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard
            let currentViewController = viewControllers?.first as? StartViewController,
            let index = pages.firstIndex(of: currentViewController),
            index > 0
        else { return nil }
        currentIndex = index - 1
        return pages[currentIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard
            let currentViewController = viewControllers?.first as? StartViewController,
            let index = pages.firstIndex(of: currentViewController),
            index < pages.endIndex - 1
        else { return nil }
        currentIndex = index + 1
        return pages[currentIndex]
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        currentIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pages.count
    }
}

extension MainPageViewController: UIPageViewControllerDelegate {
    func pageViewController(
           _ pageViewController: UIPageViewController,
           willTransitionTo pendingViewControllers: [UIViewController]
       ) {
           guard let pendingViewController = pendingViewControllers.first,
                 let currentViewController = pendingViewController as? StartViewController,
                 let index = pages.firstIndex(of: currentViewController) else { return }
           switch index {
           case pages.indices.last:
               checklastView(index: index)
           default:
               checklastView(index: index)
           }
       }
}
