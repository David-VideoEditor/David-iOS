//
//  DavidView.swift
//  DavidUI
//
//  Created by 이전희 on 2023/06/27.
//  Copyright © 2023 aepdeungi. All rights reserved.
//

import UIKit

protocol DavidView {
    init()
    func configure()
    func addSubviews()
    func makeConstraints()
}

extension DavidView where Self: UIView { }
