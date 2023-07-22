//
//  ViewModel.swift
//  DavidUI
//
//  Created by 이전희 on 2023/06/27.
//  Copyright © 2023 aepdeungi. All rights reserved.
//

import Foundation

protocol DavidViewModel {
    associatedtype Input
    associatedtype Output
    
    init()
    func transform(input: Input) -> Output
}
