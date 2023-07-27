//
//  Array+.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/27.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
