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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DavidLabel {
    struct Configuration {
        let titleLabelColor: UIColor?
        let descriptionLabelColor: UIColor?
        let titleFont: UIFont?
        let descriptionFont: UIFont?
        let backgroundColor: UIColor?
        let cornerRadius: CGFloat?
        
        init(titleLabelColor: UIColor? = DavidAssets.Colors.titleColor.color,
             descriptionLabelColor: UIColor? = DavidAssets.Colors.subTitleColor.color,
             titleFont: UIFont?,
             descriptionFont: UIFont?,
             backgroundColor: UIColor? = nil,
             cornerRadius: CGFloat? = nil) {
            self.titleLabelColor = titleLabelColor
            self.descriptionLabelColor = descriptionLabelColor
            self.titleFont = titleFont
            self.descriptionFont = descriptionFont
            self.backgroundColor = backgroundColor
            self.cornerRadius = cornerRadius
        }
        
        static var defaultConfiguration: Configuration {
            Configuration(titleLabelColor: DavidAssets.Colors.titleColor.color,
                          descriptionLabelColor: DavidAssets.Colors.titleColor.color,
                          titleFont: DavidAssets.Fonts.default.font(size: 22, weight: .bold),
                          descriptionFont: DavidAssets.Fonts.default.font(size: 14, weight: .bold),
                          backgroundColor: nil,
                          cornerRadius: nil)
        }
    }
}
