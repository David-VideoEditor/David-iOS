//
//  ImageAssets.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/21.
//

import Foundation

protocol ImageAssets {
    var image: String { get }
}

extension ImageAssets {
    var image: String {
        String(describing: self)
    }
}
