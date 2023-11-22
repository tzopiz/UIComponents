//
//  InfoView.swift
//  UIComponents
//
//  Created by Дмитрий Корчагин on 22.11.2023.
//

import UIKit
import SnapKit
import RswiftResources

open class InfoView: BaseView {
    
    var image: UIImage
    var textLabel: String
    var textSublabel: String
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.font = R.font.rubikMedium(size: 24)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = R.color.darkText()
        return label
    }()
    private let sublabel: UILabel = {
        let label = UILabel()
        label.font = R.font.rubikRegular(size: 14)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = R.color.secondaryText()
        return label
    }()
    
    public init(image: UIImage, textLabel: String, textSublabel: String) {
        self.image = image
        self.textLabel = textLabel
        self.textSublabel = textSublabel
        super.init(frame: .zero)
        imageView.image = image
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Configure

extension InfoView {
    open override func setupComponents() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(sublabel)
    }
    open override func layoutComponents() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    open override func configureComponents() {

    }
}
