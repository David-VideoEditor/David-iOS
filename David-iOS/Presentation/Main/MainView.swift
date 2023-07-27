//
//  MainVie.swift
//  David
//
//  Created by 이전희 on 2023/07/14.
//

import UIKit

final class MainView: UIView, DavidView {
    var personalProjectTitle: UIView = DavidLabel(title: "내 프로젝트", description: "_개의 프로젝트")
    var projectPageView: UIView?
    
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
        self.backgroundColor = DavidAssets.Colors.backgroundColor.color
    }
    
    func addSubviews() {
        let subViews: [UIView] = [personalProjectTitle]
        subViews.forEach { subView in
            self.addSubview(subView)
        }
    }
    
    func makeConstraints() {
        let subViews: [UIView] = [personalProjectTitle].compactMap{ $0 }
        
        subViews.forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        let constraints: [NSLayoutConstraint] = [
            personalProjectTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            personalProjectTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                          constant: 28),
            personalProjectTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                           constant: -28)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setPageView(_ pageView: UIView) {
        self.projectPageView = pageView
        addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            pageView.topAnchor.constraint(equalTo: personalProjectTitle.bottomAnchor,
                                          constant: 10),
            pageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
