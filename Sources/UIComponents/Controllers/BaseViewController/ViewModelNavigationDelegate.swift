//
//  ViewModelNavigationDelegate.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import UIKit

public protocol ViewModelNavigationDelegate: AnyObject {
    func presentController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pushController(_ viewController: UIViewController, animated: Bool)
    func dismissController(animated: Bool, completion: (() -> Void)?)
}

