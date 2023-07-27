//
//  DavidAssets.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/22.
//

import UIKit

final class DavidAssets {
    private init() { }
}

// MARK: - Images
extension DavidAssets {
    enum Images: String {
        case defaultProjectImage
        case pause
        case play
    }
}

// MARK: - Fonts
extension DavidAssets {
    enum Fonts: String {
        case `default`
    }
}

// MARK: - Colors
extension DavidAssets {
    enum Colors: String {
        case accentColor
        case subAccentColor
        case backgroundColor
        case subBackgroundColor
        case titleColor
        case subTitleColor
    }
}

// MARK: - AssetsConfigure
extension DavidAssets.Images {
    var image: UIImage {
        UIImage(named: self.rawValue.firstCapitalized)!
    }
}

extension DavidAssets.Fonts {
    func font(size:CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        if self == .default {
            return .systemFont(ofSize: size, weight: weight)
        }
        var descriptor = UIFontDescriptor(name: self.rawValue.firstCapitalized,
                                          size: size)
        descriptor = descriptor.addingAttributes(
            [UIFontDescriptor.AttributeName.traits: [UIFontDescriptor.TraitKey.weight : weight]]
        )
        return UIFont(descriptor: descriptor, size: size)
    }
    
    func font(style: UIFont.TextStyle, weight: UIFont.Weight = .regular) -> UIFont {
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        
        var font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        if self == .default {
            font = self.font(size: desc.pointSize, weight: weight)
        }
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }
}

extension DavidAssets.Colors {
    var color: UIColor {
        UIColor(named: self.rawValue.firstCapitalized)!
    }
}
