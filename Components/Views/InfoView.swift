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
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.font = R.font.rubikBlack(size: 30)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 5
        label.textColor = R.color.darkText()
        return label
    }()
    private let sublabel: UILabel = {
        let label = UILabel()
        label.font = R.font.rubikRegular(size: 14)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 5
        label.textColor = R.color.secondaryText()
        return label
    }()
    
    public init(image: UIImage, textLabel: String, textSublabel: String) {
        super.init(frame: .zero)
        self.imageView.image = image
        self.label.text = textLabel
        self.sublabel.text = textSublabel
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
        imageView.snp.makeConstraints { make in
            make.height.equalTo(375)
        }
        stackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(8)
        }
    }
    open override func configureComponents() { }
}
