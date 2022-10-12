//
//  ForYouViewController.swift
//  MyStore
//
//  Created by Илья on 06.10.2022.
//

import UIKit

private struct Constraints {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 40
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 32
    /// Height of NavBar for Small state. Usually it's just 44
    static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
    static let NavBarHeightLargeState: CGFloat = 96.5
}

/// Экран Для вас
final class ForYouViewController: UIViewController {
    
    // MARK: - Visual Components
    private lazy var pageScrollView = createScrollView()
    
    private let avatarImageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        setupUserInterfaceStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAvatar()
        setupUI()
    }
}

/// extension добавляет методы
extension ForYouViewController {
    
    // MARK: - Private Methods
    
    private func setupUserInterfaceStyle() {
        tabBarController?.overrideUserInterfaceStyle = .light
        tabBarController?.tabBar.overrideUserInterfaceStyle = .light
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(pageScrollView)
    }
    
    private func createScrollView() -> UIScrollView {
        let scrollViewRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        let scrollView = UIScrollView(frame: scrollViewRect)
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: scrollViewRect.width, height: scrollViewRect.height * 1.5 )
        
        let lineTopView = UIView(frame: CGRect(x: 0, y: 10, width: view.bounds.width, height: 1))
        lineTopView.backgroundColor = .placeholderText
        
        let whatsNewLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 20, y: 30, width: scrollViewRect.width - 100, height: 50))
            label.textColor = .label
            label.text = LabelTexts.whatsNew
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            return label
        }()
        
        let orderView = createOrderView()

        let recomendLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 20, y: 340, width: scrollViewRect.width - 100, height: 50))
            label.textColor = .label
            label.text = LabelTexts.recomend
            label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            return label
        }()

        let lineBotView = UIView(frame: CGRect(x: 0, y: 565, width: view.bounds.width, height: 1))
        lineBotView.backgroundColor = .placeholderText
        
        let yourDevaicesLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 20, y: 615, width: scrollViewRect.width - 100, height: 30))
            label.textColor = .label
            label.text = LabelTexts.devices
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            return label
        }()
        
        let showAllButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 290, y: 615, width: 120, height: 30))
        
            button.setTitle(ButtonsTitle.showAll, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 17)
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(.tintColor, for: .normal)
            return button
        }()
                
        let recomendImageView: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 30, y: 420, width: 40, height: 40))
            imageView.image = UIImage(systemName: "app.badge")
            imageView.tintColor = .systemPink
            return imageView
        }()
        
        let getNewsLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 110, y: 400, width: 250, height: 100))
            label.textColor = .label
            label.text = LabelTexts.getNews
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.numberOfLines = 3
            return label
        }()
        
        let orderNewsLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 110, y: 475, width: 300, height: 60))
            label.textColor = .placeholderText
            label.text = LabelTexts.orderNews
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.numberOfLines = 2

            return label
        }()
        
        let openOrder: UIButton = {
            let button = UIButton(frame: CGRect(x: 380, y: 465, width: 15, height: 15))
        
            button.setImage(UIImage(systemName: BarButtonImageName.forward), for: .normal)
            button.tintColor = .placeholderText
            return button
        }()
        
        scrollView.addSubview(openOrder)
        scrollView.addSubview(getNewsLabel)
        scrollView.addSubview(orderNewsLabel)
        scrollView.addSubview(recomendImageView)
        scrollView.addSubview(lineTopView)
        scrollView.addSubview(lineBotView)
        scrollView.addSubview(whatsNewLabel)
        scrollView.addSubview(recomendLabel)
        scrollView.addSubview(yourDevaicesLabel)
        scrollView.addSubview(showAllButton)
        scrollView.addSubview(orderView)
        return scrollView
    }
    
    private func createOrderView() -> UIView {
        let view = UIView(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 170))
        view.backgroundColor = .systemBackground
        view.layer.shadowColor = UIColor.systemGray3.cgColor
        view.layer.shadowOffset = .init(width: 0, height: 13)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 15
        view.layer.cornerRadius = 15
        
        let airpodsImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: ProductsImagesName.airpods))
            imageView.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let statusLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 90, y: 20, width: view.bounds.width - 40, height: 20))
            label.textColor = .label
            label.text = OrderViewText.Info.status
            label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            return label
        }()
        
        let detailLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 90, y: 50, width: view.bounds.width - 40, height: 20))
            label.textColor = .lightGray
            label.text = OrderViewText.Info.detail
            label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            return label
        }()
        
        let openOrder: UIButton = {
            let button = UIButton(frame: CGRect(x: 335, y: 50, width: 20, height: 20))
        
            button.setImage(UIImage(systemName: BarButtonImageName.forward), for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 17)
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(.tintColor, for: .normal)
            button.tintColor = .placeholderText
            return button
        }()
        
        let lineView = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 1))
        lineView.backgroundColor = .placeholderText
        
        let progressView: UIProgressView = {
            let progressView = UIProgressView(progressViewStyle: .default)
            progressView.frame = CGRect(x: 20, y: 120, width: view.bounds.width - 40, height: 0)
            progressView.tintColor = .systemGreen
            progressView.layer.transform = CATransform3DMakeScale(1, 2, 0)
            progressView.layer.cornerRadius = 20
            progressView.progress = 0.5
            return progressView
        }()
        
        let firstStageLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: progressView.frame.minX, y: 135, width: 150, height: 20))
            label.textColor = .label
            label.text = OrderViewText.Progress.firstStage
            label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            return label
        }()
        
        let secondStageLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 135, width: 150, height: 20))
            label.center.x = progressView.center.x
            label.textColor = .label
            label.textAlignment = .center
            label.text = OrderViewText.Progress.secondStage
            label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            return label
        }()
        
        let thirdStageLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: progressView.frame.maxX - 75, y: 135, width: 150, height: 20))
            label.textColor = .placeholderText
            label.text = OrderViewText.Progress.thirdStage
            label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            return label
        }()
        
        view.addSubview(airpodsImageView)
        view.addSubview(statusLabel)
        view.addSubview(detailLabel)
        view.addSubview(openOrder)
        view.addSubview(lineView)
        view.addSubview(progressView)
        view.addSubview(firstStageLabel)
        view.addSubview(secondStageLabel)
        view.addSubview(thirdStageLabel)
        
        return view
    }
    
    private func setupAvatar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(avatarImageView)
        avatarImageView.layer.cornerRadius = Constraints.ImageSizeForLargeState / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                                   constant: -Constraints.ImageRightMargin),
            avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                                    constant: -Constraints.ImageBottomMarginForLargeState),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constraints.ImageSizeForLargeState),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
        ])
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openGalleryAction)))
        avatarImageView.image = checkUserDefaults()

    }
    
    @objc private func openGalleryAction(_ sender: UITapGestureRecognizer) {
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        imagePickerView.allowsEditing = true
        present(imagePickerView, animated: true)
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Constraints.NavBarHeightSmallState
            let heightDifferenceBetweenStates =
            (Constraints.NavBarHeightLargeState - Constraints.NavBarHeightSmallState)
            
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Constraints.ImageSizeForSmallState / Constraints.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        let sizeDiff = Constraints.ImageSizeForLargeState * (1.0 - factor) // 8.0
        
        let yTranslation: CGFloat = {
            let maxYTranslation = Constraints.ImageBottomMarginForLargeState -
            Constraints.ImageBottomMarginForSmallState + sizeDiff
            
            return max(0, min(maxYTranslation,
                              (maxYTranslation - coeff * (Constraints.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        avatarImageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    private func saveUserDefaults(image: Data) {
        let defaults = UserDefaults.standard
        guard defaults.object(forKey: "avatar") != nil else {
            defaults.setValue(image, forKey: "avatar")
            return
        }
        defaults.removeObject(forKey: "avatar")
        defaults.setValue(image, forKey: "avatar")
    }
    
    private func checkUserDefaults() -> UIImage? {
        let userDefaults = UserDefaults.standard
        guard let dataImage = userDefaults.object(forKey: "avatar") as? Data else {
            let image = UIImage(systemName: "person.circle.fill")?.resizeImage(to: CGSize(width: 40, height: 40))
            return image
        }
        guard let image = UIImage(data: dataImage) else {
            let image = UIImage(systemName: "person.circle.fill")?.resizeImage(to: CGSize(width: 40, height: 40))
            return image
        }
        return image
    }
}

/// UINavigationControllerDelegate
extension ForYouViewController: UINavigationControllerDelegate {}

/// UIScrollDelegate
extension ForYouViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

/// UIImagePickerControllerDelegate
extension ForYouViewController: UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            guard let image = info[.editedImage] as? UIImage else { return }
            let uiImage = image.resizeImage(to: CGSize(width: 40, height: 40))
            avatarImageView.image = uiImage
            guard let imageData = image.pngData() else { return }
            saveUserDefaults(image: imageData)
            self.dismiss(animated: true)
        }
}

/// Добавляет ресайз
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
