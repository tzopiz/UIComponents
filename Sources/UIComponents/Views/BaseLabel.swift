//
//  BaseLabel.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/18/24.
//

import UIKit

///
/// ```swift
/// // by defaults:
/// self.numberOfLines = 0
/// self.textColor = .label,
/// self.fontSize = 15
/// self.textAlignment = .left
/// self.lineBreakMode = .byWordWrapping
/// ```
open class BaseLabel: UILabel {
    public enum FontStyle {
        case black, bold, italic, light, regular
    }
    enum Font {
        static func rubik(style fontStyle: FontStyle, size fontSize: CGFloat) -> UIFont? {
            switch fontStyle {
            case .italic:       return UIFont(name: "AppleSDGothicNeo-Italic", size: fontSize)
            case .light:        return UIFont(name: "AppleSDGothicNeo-Light", size: fontSize)
            case .regular:      return UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize)
            case .bold:         return UIFont(name: "AppleSDGothicNeo-Bold", size: fontSize)
            case .black:        return UIFont(name: "AppleSDGothicNeo-Black", size: fontSize)
            }
        }
    }
    public init(
        text: String? = nil,
        textColor: UIColor? = .label,
        fontSize: CGFloat = 15,
        fontType: FontStyle = .regular,
        textAlignment: NSTextAlignment = .left,
        lineBreakMode: NSLineBreakMode = .byWordWrapping
    ) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.lineBreakMode = lineBreakMode
        self.textColor = textColor

        self.text = text
        self.numberOfLines = 0
        setupViews()
        layoutViews()
        configureViews()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Configure
@objc public
extension BaseLabel {
    /// Добавляет подвиды на представление.
    /// Добавьте код для добавления подвидов на представление,
    /// таких как их инициализация, настройка свойств и добавление на представление.
    func setupViews() { }
    /// Устанавливает ограничения для подвидов внутри представления.
    /// Добавьте код для установки ограничений для подвидов,
    /// таких как установка автолейаут-ограничений, задание отступов и т.д.
    func layoutViews() { }
    /// Настраивает внешний вид представления.
    /// Добавьте код для настройки внешнего вида представления,
    /// таких как установка фона, цветов, шрифтов и других свойств визуальных элементов.
    /// Вы также можете применять стили, добавлять тени, закруглять углы и т.д.
    func configureViews() { }
}
