//
//  UITableViewCell.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 7/1/24.
//

import UIKit

extension UITableViewCell: IReusableView {
    @objc public class var reuseIdentifier: String {
        String(describing: UITableViewCell.self)
    }
}

