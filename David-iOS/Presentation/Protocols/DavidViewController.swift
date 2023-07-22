//
//  DavidViewController.swift
//  DavidUI
//
//  Created by 이전희 on 2023/06/27.
//  Copyright © 2023 aepdeungi. All rights reserved.
//

import UIKit

protocol DavidViewController {
    associatedtype ViewType: DavidView
    associatedtype ViewModelType: DavidViewModel

    var customView: ViewType { get }
    var viewModel: ViewModelType { get }
    
    func configure()
    func bind()
}

extension DavidViewController where Self: UIViewController {
    var customView: ViewType {
        return self.view as! ViewType
    }
    
    var viewModel: ViewModelType {
        return ViewModelType()
    }
}
