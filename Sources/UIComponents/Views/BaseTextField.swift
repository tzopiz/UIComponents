//
//  BaseTextField.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit

open class BaseTextField: UITextField {
    private var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
        configureViews()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    /// ```swift
    /// placeholder: String? = nil,
    /// cornerRadius: CGFloat = 0,
    /// borderWidth: CGFloat = 0,
    /// borderColor: CGColor? = UIColor.clear.cgColor,
    /// textColor: UIColor = .clear,
    /// font: UIFont? = UIFont(name: "AppleSDGothicNeo-Regular", size: 15),
    /// backgroundColor: UIColor = UIColor.clear
    /// ```
    open func configure(
        placeholder: String? = nil,
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0,
        borderColor: CGColor? = UIColor.clear.cgColor,
        textColor: UIColor = .clear,
        font: UIFont? = UIFont(name: "AppleSDGothicNeo-Regular", size: 15),
        backgroundColor: UIColor = .clear,
        padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    ) {
        self.placeholder = placeholder
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.textColor = textColor
        self.layer.borderColor = borderColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.padding = padding
    }
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

// MARK: - Configure
@objc
extension BaseTextField {
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
