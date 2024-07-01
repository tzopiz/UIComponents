//
//  UICollectionViewCell.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 6/12/24.
//

import UIKit

public protocol IReusableView {
    static var reuseIdentifier: String { get }
}

extension UICollectionViewCell {
    @objc public class override var reuseIdentifier: String {
        String(describing: UICollectionViewCell.self)
    }
}
