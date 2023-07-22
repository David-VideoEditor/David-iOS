//
//  MainVie.swift
//  David
//
//  Created by 이전희 on 2023/07/14.
//

import UIKit

final class MainView: UIView, DavidView {
    let davidLogo: UIView = UIView()
    let createButton: UIButton = UIButton()
    let porjectView: UIView = {
        let view = UIView()
        view.backgroundColor = .subBackgroundColor
        view.layer.cornerRadius = 18
        return view
    }()
    
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
        let subViews: [UIView] = [davidLogo, porjectView, createButton]
        
        subViews.forEach { subView in
            self.addSubview(subView)
        }
    }
    
    func makeConstraints() {
        let subViews: [UIView] = [davidLogo, porjectView, createButton]
        
        subViews.forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        let constraints: [NSLayoutConstraint] = [
            davidLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            davidLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            createButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            createButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            createButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            createButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            porjectView.topAnchor.constraint(equalTo: davidLogo.bottomAnchor,
                                             constant: 30),
            porjectView.heightAnchor.constraint(equalToConstant: 100),
            porjectView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                 constant: 20),
            porjectView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
