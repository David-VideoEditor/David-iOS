//
//  String+.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/22.
//

import Foundation

extension String {
    var firstCapitalized: String {
        let startIndex = self.startIndex
        guard self.count > 1 else {
            return self.count == 0 ? "" : self[startIndex].uppercased()
        }
        
        let secondIndex = self.index(after: startIndex)
        return self[startIndex].uppercased() + self[secondIndex...]
    }
}
