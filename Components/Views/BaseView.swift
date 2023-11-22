//
//  BaseView.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 22.11.2023.
//

import UIKit

class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        layoutComponents()
        configureComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupComponents()
        layoutComponents()
        configureComponents()
    }
}

@objc
extension BaseView {
    open func setupComponents() { }
    open func layoutComponents() { }
    open func configureComponents() { }
}
