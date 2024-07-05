//
//  BaseViewController_2.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

open class BaseViewController<ViewModel: IBaseViewModel>: UIViewController {
    public enum NavBarPosition {
        case left, right
    }
    
    public var viewModel: ViewModel!
    public var presentHandler: ((UIViewController, Bool) -> Void)?
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureViews()
    }
    
    // MARK: - Configure
    /// Добавляет подвиды на контроллер.
    /// Добавьте код для добавления подвидов на контроллер,
    /// таких как их инициализация, настройка свойств и добавление на представление.
    open func setupViews() { }
    /// Устанавливает ограничения для подвидов внутри контроллера.
    /// Добавьте код для установки ограничений для подвидов,
    /// таких как установка автолейаут-ограничений, задание отступов и т.д.
    open func layoutViews() { }
    /// Настраивает внешний вид контроллера.
    /// Добавьте код для настройки внешнего вида контроллера,
    /// таких как установка фона, цветов, шрифтов и других свойств визуальных элементов.
    /// Вы также можете применять стили, добавлять тени, закруглять углы и т.д.
    open func configureViews() {
        navigationItem.title = viewModel.title
        view.backgroundColor = .secondarySystemBackground
        viewModel.navigationDelegate = self
    }
}

// MARK: - Supporting Functions
extension BaseViewController {
    public func addNavBarButton(
        at position: NavBarPosition,
        with title: String? = nil,
        image: UIImage? = nil,
        selector: Selector
    ) {
        let button = UIButton(type: .system)
        if let title = title { button.setTitle(title, for: .normal) }
        if let image = image { button.setImage(image, for: .normal) }
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        switch position {
        case .left:
            button.addTarget(self, action: selector, for: .touchUpInside)
            let barButton = UIBarButtonItem(customView: button)
            if navigationItem.leftBarButtonItems != nil {
                navigationItem.leftBarButtonItems?.append(barButton)
            } else { navigationItem.leftBarButtonItem = barButton }
        case .right:
            button.addTarget(self, action: selector, for: .touchUpInside)
            let barButton = UIBarButtonItem(customView: button)
            if navigationItem.rightBarButtonItems != nil {
                navigationItem.rightBarButtonItems?.append(barButton)
            } else { navigationItem.rightBarButtonItem = barButton }
        }
    }
}

// MARK: - ViewModelNavigationDelegate
extension BaseViewController: ViewModelNavigationDelegate {
    public func pushController(
        _ viewController: UIViewController,
        animated: Bool
    ) {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(viewController, animated: animated)
    }
    public func dismissController(animated: Bool, completion: (() -> Void)? = nil) {
        guard let navigationController = navigationController else { return }
        navigationController.dismiss(animated: animated, completion: completion)
    }
    public func presentController(
        _ viewController: UIViewController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        present(viewController, animated: animated, completion: completion)
    }
}
