//
//  File.swift
//
//
//  Created by Дмитрий Корчагин on 6/12/24.
//

import UIKit

/// Базовая реализация `UITabBarController` в приложении с несколькими экранами.
/// Переопределите метод `configureAppearance(_: Array<Tab>)` для
/// кастомного отображения элементов `Tabbar`
open class TabBarController: UITabBarController {
    
    public struct Tab {
        public let title: String?
        public let image: UIImage?
        public let selectedImage: UIImage?
        public let viewController: UIViewController
        
        /// Инициализирует новую вкладку с указанными параметрами.
        /// - Parameters:
        ///   - title: Название вкладки. По умолчанию - `nil`.
        ///   - image: Изображение вкладки в обычном состоянии. По умолчанию - `nil`.
        ///   - selectedImage: Изображение вкладки в выбранном состоянии. По умолчанию - `nil`.
        ///   - viewController: Контроллер представления, связанный с данной вкладкой.
        public init(
            title: String? = nil,
            image: UIImage? = nil,
            selectedImage: UIImage? = nil,
            viewController: UIViewController
        ) {
            self.title = title
            self.image = image
            self.selectedImage = selectedImage
            self.viewController = viewController
        }
    }
    
    public init(
        tabs: Array<Tab>,
        nibName nibNameOrNil: String? = nil,
        bundle nibBundleOrNil: Bundle? = nil
    ) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureAppearance(with: tabs)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func switchTo(tab index: Int) {
        selectedIndex = index
    }
    /// Настраивает внешний вид панели вкладок с предоставленными вкладками.
    ///
    /// - Parameters:
    ///   - tabs: Массив объектов `Tab`, представляющих каждую вкладку на панели вкладок.
    ///
    /// Этот метод настраивает внешний вид панели вкладок, включая цвет ее оттенка, цвет оттенка невыбранного элемента,
    /// цвет фона и назначает контроллеры представления для каждой вкладки на основе предоставленных объектов `Tab`.
    open func configureAppearance(with tabs: Array<Tab>) {
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .secondaryLabel
        tabBar.backgroundColor = .systemBackground
        
        let controllers: [NavigationController] = tabs.enumerated().map { index, tab in
            let controller = NavigationController(rootViewController: tab.viewController)
            controller.tabBarItem = UITabBarItem(title: tab.title,
                                                 image: tab.image,
                                                 selectedImage: tab.selectedImage)
            controller.tabBarItem.tag = index
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
}
