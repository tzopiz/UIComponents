//
//  BaseCollectionViewController.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

open class BaseCollectionViewController<ViewModel: ICollectionViewModel, Cell: BaseCollectionViewCell>: BaseViewController<ViewModel>, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public let collectionView: UICollectionView
    
    public init(viewModel: ViewModel, layout: UICollectionViewLayout) {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        super.init(viewModel: viewModel)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func setupViews() {
        super.setupViews()
        view.addSubviews(collectionView)
    }
    
    open override func layoutViews() {
        super.layoutViews()
    }
    
    open override func configureViews() {
        super.configureViews()
        collectionView.registerCells(Cell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    // MARK: - UICollectionViewDataSource
    open func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        return 1
    }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.items.count
    }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Cell.reuseIdentifier,
            for: indexPath
        ) as? Cell
        else { return UICollectionViewCell() }
        return cell
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    open func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 400)
    }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    )
    -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 8
    }
    
    // MARK: - Actions
    @objc open func refreshData() {
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.beginRefreshing()
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    @objc open func scrollToTop() {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) { }
}
