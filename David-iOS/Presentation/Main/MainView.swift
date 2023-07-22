//
//  MainVie.swift
//  David
//
//  Created by 이전희 on 2023/07/14.
//

import UIKit

final class MainView: UIView, DavidView {
    init() {
        super.init(frame: .zero)
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.backgroundColor = .backgroundColor
    }
    
    func addSubviews() {
        let subViews: [UIView] = []
        
        subViews.forEach { subView in
            self.addSubview(subView)
        }
    }
    
    func makeConstraints() {
        let subViews: [UIView] = []
        
        subViews.forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        let constraints: [NSLayoutConstraint] = [
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
