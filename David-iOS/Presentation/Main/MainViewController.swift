//
//  MainViewController.swift
//  David
//
//  Created by 이전희 on 2023/07/14.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, DavidViewController {
    typealias ViewType = MainView
    typealias ViewModelType = MainViewModel
    
    private var pageViewController = DavidPageViewController()
    
    var itemViews: [UIView] = [
        DavidProjectItemView(),
        DavidProjectItemView(),
        DavidProjectItemView(),
        DavidProjectItemView(),
        DavidProjectItemView(),
        DavidProjectItemView()
        
    ]
    
    let disposeBag = DisposeBag()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view =  ViewType.init() as UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
    }
    
    func configure() {
        addChild(pageViewController)
        pageViewController.setItemViews(itemViews)
        self.customView.setPageView(pageViewController.view)
        self.pageViewController.delegate = self
    }
    
    func bind() {
        // customView.createButton.rx.tap
        //     .subscribe { [weak self] _ in
        //         print("clicked")
        //         // let viewController = SelectMediaViewController()
        //         // self?.navigationController?.present(viewController, animated: true)
        //     }
        //     .disposed(by: disposeBag)
    }
}

extension MainViewController: DavidPageViewControllerDelegate {
    func pageChanged(pageViewController: UIPageViewController,
                     pageControl: UIPageControl,
                     index changedPage: Int) {
        
    }
    
    func pageClicked(viewController: UIViewController,
                     index clickedPage: Int) {
        
    }
}
