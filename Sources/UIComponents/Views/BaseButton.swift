//
//  BaseButton.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

open class BaseButton: UIButton {
    convenience public init() {
        self.init(type: .system)
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        titleLabel?.textColor = .label
    }
}
