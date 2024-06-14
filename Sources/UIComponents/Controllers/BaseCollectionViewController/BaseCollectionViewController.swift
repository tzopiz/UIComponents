//
//  BaseCollectionViewController.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit

open class BaseCollectionViewController<ViewModel: ICollectionViewModel, Cell: UICollectionViewCell>: UICollectionViewController, UICollectionViewDelegateFlowLayout where Cell: IReusableCell {
    
    public var viewModel: ViewModel
    
    public init(viewModel: ViewModel, layout: UICollectionViewLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureViews()
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refreshData()
    }
    
    // MARK: - Configure
    /// Добавляет подвиды на контроллер.
    /// Добавьте код для добавления подвидов на контроллер,
    /// таких как их инициализация, настройка свойств и добавление на представление.
    open func setupViews() { }
    /// Устанавливает ограничения для подвидов внутри контроллера.
    /// Добавьте код для установки ограничений для подвидов,
    /// таких как установка автолейаут-ограничений, задание отступов и т.д.
    open func layoutViews() { }
    /// Настраивает внешний вид контроллера.
    /// Добавьте код для настройки внешнего вида контроллера,
    /// таких как установка фона, цветов, шрифтов и других свойств визуальных элементов.
    /// Вы также можете применять стили, добавлять тени, закруглять углы и т.д.
    open func configureViews() {
        navigationItem.title = viewModel.title
        view.backgroundColor = .secondarySystemBackground
        collectionView.registerCells(Cell.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false 
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    // MARK: - UICollectionViewDataSource
    open override func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    open override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int { viewModel.items.count }
    open override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: Cell.self),
            for: indexPath
        ) as? Cell
        else { return UICollectionViewCell() }
        return cell
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    open func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize { CGSize(width: collectionView.frame.width, height: 400) }
    
    open func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int)
    -> UIEdgeInsets { return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0) }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat { 8 }
    
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
}
