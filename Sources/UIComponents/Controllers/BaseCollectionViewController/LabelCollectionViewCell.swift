//
//  LabelCollectionViewCell.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

open class LabelCollectionViewCell: BaseCollectionViewCell {
    open override class var reuseIdentifier: String { String(describing: LabelCollectionViewCell.self) }
    public let label = UILabel()
    open override func configure(_ parametr: Any) {
        guard let title = parametr as? String else { return }
        label.text = title
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension LabelCollectionViewCell {
    open override func setupViews() {
        addSubviews(label)
    }
    open override func layoutViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
    }
}
