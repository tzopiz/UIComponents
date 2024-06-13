//
//  LabelCollectionViewCell.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

open class LabelCollectionViewCell: BaseCollectionViewCell {
    override class var reuseIdentifier: String { String(describing: LabelCollectionViewCell.self) }
    private let label = UILabel()
    override func configure(_ parametr: Any) {
        guard let title = parametr as? String else { return }
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension LabelCollectionViewCell {
    open override func setupViews() {
        addSubviews(label)
    }
    override open func layoutViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
    }
}
