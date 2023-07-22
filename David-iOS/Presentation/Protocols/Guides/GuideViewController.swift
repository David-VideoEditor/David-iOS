//
//  GuideViewController.swift
//  David
//
//  Created by 이전희 on 2023/07/15.
//

import UIKit

class GuideViewController: UIViewController, DavidViewController {
    typealias ViewType = GuideView
    typealias ViewModelType = GuideViewModel
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ViewType.init() as UIView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        
    }
    
    func bind() {
        
    }
}
