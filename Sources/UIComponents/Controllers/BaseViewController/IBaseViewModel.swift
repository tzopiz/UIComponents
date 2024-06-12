//
//  BaseViewModel.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/27/24.
//

import Foundation

public protocol IBaseViewModel {
    var title: String? { get }
    var navigationDelegate: ViewModelNavigationDelegate? { get set }
}
