//
//  DavidComponents.swift
//  David
//
//  Created by 이전희 on 2023/07/19.
//

import UIKit

final class DavidComponents {
    private init() {}
    
    static func davidLogo(color: UIColor = .gray) -> UIView {
        let view = UIView()
        let label = UILabel()
        let divider = DavidComponents.divider(color: color, height: 3)
        label.text = "David"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .left
        label.textColor = color
        
        view.addSubview(label)
        view.addSubview(divider)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints: [NSLayoutConstraint] = [
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            view.widthAnchor.constraint(equalTo: label.widthAnchor),
            view.heightAnchor.constraint(equalTo: label.heightAnchor),
            divider.topAnchor.constraint(equalTo: label.bottomAnchor,
                                         constant: 2),
            divider.leadingAnchor.constraint(equalTo: label.leadingAnchor,
                                             constant: 8),
            divider.trailingAnchor.constraint(equalTo: label.trailingAnchor,
                                             constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
        return view
    }
    
    static func divider(color: UIColor, height: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
    
    static func davidButton(title: String,
                            ofSize: CGFloat,
                            fontWeight: UIFont.Weight = .bold,
                            tintColor: UIColor = .white) -> UIButton {
        var configure = UIButton.Configuration.plain()
        configure.baseForegroundColor = tintColor
        
        var titleAttr = AttributedString.init(title)
        titleAttr.font = .systemFont(ofSize: ofSize, weight: fontWeight)
        configure.attributedTitle = titleAttr
        
        return UIButton(configuration: configure)
    }
    
    static func davidButton(systemName: String,
                            pointSize: CGFloat = 18,
                            symbolWeight: UIImage.SymbolWeight = .bold,
                            tintColor: UIColor = .white) -> UIButton {
        var configure = UIButton.Configuration.plain()
        configure.baseForegroundColor = tintColor
        let pointSize = pointSize
        let symbolWeight = symbolWeight
        let uiimageConfigure = UIImage.SymbolConfiguration(pointSize: pointSize,
                                                           weight: symbolWeight,
                                                           scale: .large)
        configure.image = UIImage(systemName: systemName,
                                  withConfiguration: uiimageConfigure)
        return UIButton(configuration: configure)
    }
    
    static func davidButton(title: String,
                            ofSize: CGFloat,
                            fontWeight: UIFont.Weight = .bold,
                            systemName: String,
                            pointSize: CGFloat? = nil,
                            symbolWeight: UIImage.SymbolWeight? = nil,
                            tintColor: UIColor = .white,
                            imagePadding: CGFloat = 10) -> UIButton {
        var configure = UIButton.Configuration.plain()
        configure.baseForegroundColor = tintColor
        
        var titleAttr = AttributedString.init(title)
        titleAttr.font = .systemFont(ofSize: ofSize, weight: fontWeight)
        configure.attributedTitle = titleAttr
        
        let pointSize = pointSize ?? (ofSize + 2)
        let symbolWeight = symbolWeight ?? fontWeight.symbolWeight()
        let uiimageConfigure = UIImage.SymbolConfiguration(pointSize: pointSize,
                                                           weight: symbolWeight,
                                                           scale: .large)
        configure.image = UIImage(systemName: systemName,
                                  withConfiguration: uiimageConfigure)
        configure.imagePadding = imagePadding
        return UIButton(configuration: configure)
    }
    
}
