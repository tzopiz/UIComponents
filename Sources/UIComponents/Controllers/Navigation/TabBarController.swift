//
//  File.swift
//
//
//  Created by Дмитрий Корчагин on 6/12/24.
//

import UIKit

open class TabBarController: UITabBarController {
    public struct Tab {
        public let title: String?
        public let image: UIImage?
        public let selectedImage: UIImage?
        public let viewController: UIViewController
        
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
