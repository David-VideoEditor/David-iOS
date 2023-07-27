//
//  UIView+.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/28.
//

import UIKit

extension UIView {
    func equalTo(_ view: UIView,
                 inset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: inset.right).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: inset.bottom).isActive = true
    }
    
    func equalToWidth(_ view: UIView,
                      inset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: inset.right).isActive = true
    }
    
    func equalToWidth(_ view: UIView,
                      horizontalInset: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalInset).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalInset).isActive = true
    }
    
    func equalToTop(_ view: UIView,
                       topInset: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: topInset).isActive = true
    }
    
    func equalToBottom(_ view: UIView,
                       bottomInset: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomInset).isActive = true
    }
    
    func toTop(_ view: UIView,
               topInset: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: view.topAnchor,
                                     constant: topInset).isActive = true
    }
    
    func toBottom(_ view: UIView,
                  topInset: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.bottomAnchor,
                                  constant: topInset).isActive = true
    }
}

