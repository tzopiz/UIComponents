//
//  UICollectionReusableView.swift
//
//
//  Created by Дмитрий Корчагин on 7/1/24.
//

import UIKit

extension UICollectionReusableView: IReusableView {
    @objc public class var reuseIdentifier: String {
        String(describing: UICollectionReusableView.self)
    }
}
