//
//  File.swift
//  
//
//  Created by Дмитрий Корчагин on 6/12/24.
//

import UIKit

open class NavigationController: UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.secondaryLabel,
            .font: UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!
        ]
    }
}


