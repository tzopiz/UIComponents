//
//  File.swift
//
//
//  Created by Дмитрий Корчагин on 6/12/24.
//

import UIKit

open class TabBarController: UITabBarController {
    public struct Tab {
        let title: String?
        let image: UIImage?
        let selectedImage: UIImage?
        let viewController: UIViewController
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
    
    private func switchTo(tab index: Int) {
        selectedIndex = index
    }
    
    private func configureAppearance(with tabs: Array<Tab>) {
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
