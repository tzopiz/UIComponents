//
//  CollectionViewModel.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

public protocol ICollectionViewModel: IBaseViewModel {
    associatedtype ItemType
    var items: [ItemType] { get }
    func item(for indexPath: IndexPath) -> ItemType
}
open class CollectionViewModel: ICollectionViewModel {
    public var title: String?
    private(set) public var items: [String]
    public var navigationDelegate: ViewModelNavigationDelegate?
    
    public init(title: String? = nil, items: [String]) {
        self.items = items
        self.title = title
    }
    public func item(for indexPath: IndexPath) -> ItemType { items[indexPath.row] }
}
