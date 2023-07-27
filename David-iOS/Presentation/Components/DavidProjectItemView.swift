//
//  DavidProjectItemView.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/27.
//

import UIKit

final class DavidProjectItemView: UIView {
    private lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private var thumbnailImageView: UIImageView = UIImageView()
    
    private var informationBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = DavidAssets.Colors.subBackgroundColor.color
        return view
    }()
    
    private var projectNameLabel: UILabel = {
        let label = UILabel()
        label.font = DavidAssets.Fonts.default.font(size: 20, weight: .bold)
        label.textColor = DavidAssets.Colors.titleColor.color
        return label
    }()
    
    private var latestTimeLabel: UILabel = {
        let label = UILabel()
        label.font = DavidAssets.Fonts.default.font(size: 18, weight: .regular)
        label.textColor = DavidAssets.Colors.subTitleColor.color
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        thumbnailImageView.image = DavidAssets.Images.defaultProjectImage.image
        projectNameLabel.text = "unknown"
        latestTimeLabel.text = "aaa"
        latestTimeLabel.font = DavidAssets.Fonts.default.font(size: 18, weight: .bold)
    }
    
    private func addSubviews() {
        let contentSubViews: [UIView] = [thumbnailImageView,
                                         informationBackgroundView,
                                         projectNameLabel,
                                         latestTimeLabel]
        contentSubViews.forEach { view in
            contentView.addSubview(view)
        }
        
        
        let subViews: [UIView] = [contentView]
        subViews.forEach { subView in
            self.addSubview(subView)
        }
    }
    
    private func makeConstraints() {
        thumbnailImageView.equalTo(contentView)
        projectNameLabel.equalToWidth(contentView, horizontalInset: 10)
        projectNameLabel.toTop(latestTimeLabel)
        latestTimeLabel.equalToWidth(contentView, horizontalInset: 10)
        latestTimeLabel.equalToBottom(contentView, bottomInset: -10)
        informationBackgroundView.equalToWidth(contentView)
        informationBackgroundView.equalToTop(projectNameLabel, topInset: -10)
        informationBackgroundView.equalToBottom(contentView)
        
        contentView.equalTo(self, inset: UIEdgeInsets(top: 10, left: 20, bottom: -10, right: -20))
    }
}
