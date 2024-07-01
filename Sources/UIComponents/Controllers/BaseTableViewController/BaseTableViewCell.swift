//
//  BaseTableViewCell.swift
//
//
//  Created by Дмитрий Корчагин on 7/1/24.
//

import UIKit

open class BaseTableViewCell: UITableViewCell, IConfigurable {
    
    open override class var reuseIdentifier: String {
        String(describing: BaseTableViewCell.self)
    }
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        layoutViews()
        configureViews()
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure(_ parametr: Any) { }
}

// MARK: - Configure
@objc
extension BaseTableViewCell {
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
