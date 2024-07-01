//
//  UITableViewHeaderFooterView.swift
//
//
//  Created by Дмитрий Корчагин on 7/1/24.
//

import UIKit

extension UITableViewHeaderFooterView: IReusableView {
    @objc public class var reuseIdentifier: String {
        String(describing: UITableViewHeaderFooterView.self)
    }
}
