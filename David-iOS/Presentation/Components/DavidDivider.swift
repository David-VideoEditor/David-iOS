//
//  DavidDivider.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/22.
//

import UIKit

final class DavidDivider: UIView {
    init(color: UIColor, height: CGFloat){
        super.init(frame: .zero)
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
