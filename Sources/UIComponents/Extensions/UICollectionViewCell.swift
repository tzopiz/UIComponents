//
//  UICollectionViewCell.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 6/12/24.
//

import UIKit

public protocol IReusableCell {
    static var reuseIdentifier: String { get }
}
extension UICollectionViewCell: IReusableCell {
    @objc public class var reuseIdentifier: String { String(describing: UICollectionViewCell.self) }
}

