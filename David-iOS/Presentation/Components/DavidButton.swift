//
//  DavidButton.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/22.
//

import UIKit

final class DavidButton: UIButton {
    
    init(title: String,
         ofSize: CGFloat = 18,
         fontWeight: UIFont.Weight = .bold,
         symbolName: String? = nil,
         pointSize: CGFloat = 18,
         symbolWeight: UIImage.SymbolWeight = .bold,
         foregroundColor: UIColor = DavidAssets.Colors.titleColor.color,
         backgroundColor: UIColor = DavidAssets.Colors.backgroundColor.color,
         imagePadding: CGFloat = 10){
        super.init(frame: .zero)
        self.configuration = DavidButton.craeteConfiguration(title: title,
                                                         ofSize: ofSize,
                                                         fontWeight: fontWeight,
                                                         symbolName: symbolName,
                                                         pointSize: pointSize,
                                                         symbolWeight: symbolWeight,
                                                         foregroundColor: foregroundColor,
                                                         backgroundColor: backgroundColor,
                                                         imagePadding: imagePadding)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func craeteConfiguration(title: String,
                                ofSize: CGFloat = 18,
                                fontWeight: UIFont.Weight = .bold,
                                symbolName: String? = nil,
                                pointSize: CGFloat = 18,
                                symbolWeight: UIImage.SymbolWeight = .bold,
                                foregroundColor: UIColor = DavidAssets.Colors.titleColor.color,
                                    backgroundColor: UIColor = DavidAssets.Colors.backgroundColor.color,
                                imagePadding: CGFloat = 10) -> UIButton.Configuration {
        
        var configure = UIButton.Configuration.plain()
        
        var titleAttr = AttributedString.init(title)
        titleAttr.font = .systemFont(ofSize: ofSize, weight: fontWeight)
        configure.attributedTitle = titleAttr
        
        configure.baseForegroundColor = foregroundColor
        
        if let symbolName = symbolName {
            let uiimageConfigure = UIImage.SymbolConfiguration(pointSize: pointSize,
                                                               weight: symbolWeight,
                                                               scale: .large)
            configure.image = UIImage(systemName: symbolName,
                                      withConfiguration: uiimageConfigure)
        }
        
        configure.imagePadding = imagePadding
        configure.baseBackgroundColor = backgroundColor
        return configure
    }
}
