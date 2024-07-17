//
//  UITableView.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 7/1/24.
//

import UIKit

public extension UITableView {
    /// Регистрирует указанные типы ячеек для использования в таблице.
    /// - Parameter cells: Типы ячеек, которые необходимо зарегистрировать.
    func registerCells(_ cells: UITableViewCell.Type...) {
        cells.forEach { cell in
            register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
        }
    }
    
    /// Регистрирует указанные типы представлений для использования в таблице.
    /// - Parameter views: Типы представлений, которые необходимо зарегистрировать.
    func registerReuseViews(_ views: UITableViewHeaderFooterView.Type...) {
        views.forEach { view in
            register(view.self, forHeaderFooterViewReuseIdentifier: view.reuseIdentifier)
        }
    }
}

