//
//  DavidLabel.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/22.
//

import UIKit

final class DavidLabel: UIView {
    var titleLabel: UILabel = UILabel()
    var descriptionLabel: UILabel? = nil
    
    init(title: String,
         description: String? = nil,
         configure: DavidLabel.Configuration){
        super.init(frame: .zero)
        self.configure(title: title,
                       description: description,
                       configure: configure)
        addSubviews()
        makeConstraints()
    }
    
    convenience init(title: String,
         description: String? = nil){
        self.init(title: title,
                  description: description,
                  configure: Configuration.defaultConfiguration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String,
                   description: String? ,
                   configure: DavidLabel.Configuration){
        titleLabel.text = title
        titleLabel.textColor = configure.titleColor
        titleLabel.font = configure.titleFont
        
        if let description = description {
            descriptionLabel = UILabel()
            descriptionLabel?.text = description
            descriptionLabel?.textColor = configure.descriptionColor
            descriptionLabel?.font = configure.descriptionFont
        }
        if let backgroundColor = configure.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let cornerRadius = configure.cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    private func addSubviews() {
        let subViews: [UIView?] = [descriptionLabel, titleLabel]
        
        subViews.forEach { view in
            guard let view = view else { return }
            self.addSubview(view)
        }
    }
    
    private func makeConstraints() {
        let subViews: [UIView?] = [descriptionLabel, titleLabel]
        
        self.translatesAutoresizingMaskIntoConstraints = false
        subViews.forEach { label in
            guard let label = label else { return }
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraints: [NSLayoutConstraint] = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        if let descriptionLabel = descriptionLabel {
            constraints.append(contentsOf: [
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor)
            ])
        } else {
            constraints.append(contentsOf: [
                self.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor)
            ])
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension DavidLabel {
    struct Configuration {
        let titleColor: UIColor?
        let titleFont: UIFont?
        let descriptionColor: UIColor?
        let descriptionFont: UIFont?
       
        let backgroundColor: UIColor?
        let cornerRadius: CGFloat?
        
        init(titleColor: UIColor? = DavidAssets.Colors.titleColor.color,
             titleFont: UIFont? = DavidAssets.Fonts.default.font(size: 22, weight: .bold),
             descriptionColor: UIColor? = DavidAssets.Colors.subTitleColor.color,
             descriptionFont: UIFont? = DavidAssets.Fonts.default.font(size: 14, weight: .regular),
             backgroundColor: UIColor? = nil,
             cornerRadius: CGFloat? = nil) {
            self.titleColor = titleColor
            self.titleFont = titleFont
            self.descriptionColor = descriptionColor
            self.descriptionFont = descriptionFont
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
        }
        
        static var defaultConfiguration: Configuration {
           Configuration(titleColor: DavidAssets.Colors.titleColor.color,
                         titleFont: DavidAssets.Fonts.default.font(size: 22, weight: .bold),
                         descriptionColor: DavidAssets.Colors.subTitleColor.color,
                         descriptionFont: DavidAssets.Fonts.default.font(size: 14, weight: .regular),
                         backgroundColor: nil,
                         cornerRadius: nil)
        }
    }
}
