//
//  BaseStackView.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit

open class BaseStackView: UIStackView {
    public init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 8) {
        super.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
    }
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
@objc
extension BaseStackView {
    /// Добавляет подвиды на представление.
    /// Добавьте код для добавления подвидов на представление,
    /// таких как их инициализация, настройка свойств и добавление на представление.
    open func setupViews() { }
    /// Устанавливает ограничения для подвидов внутри представления.
    /// Добавьте код для установки ограничений для подвидов,
    /// таких как установка автолейаут-ограничений, задание отступов и т.д.
    open func layoutViews() { }
    /// Настраивает внешний вид представления.
    /// Добавьте код для настройки внешнего вида представления,
    /// таких как установка фона, цветов, шрифтов и других свойств визуальных элементов.
    /// Вы также можете применять стили, добавлять тени, закруглять углы и т.д.
    open func configureViews() { }
}

extension BaseStackView {
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
