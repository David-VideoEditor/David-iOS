//
//  DavidPageViewController.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/27.
//

import UIKit

class DavidPageViewController: UIViewController {
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: nil)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(pageClicked))
        pageViewController.view.addGestureRecognizer(gesture)
        return pageViewController
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = DavidAssets.Colors.accentColor.color
        pageControl.pageIndicatorTintColor = DavidAssets.Colors.subTitleColor.color
        pageControl.addTarget(self, action: #selector(pageControlChanged), for: .valueChanged)
        return pageControl
    }()
    
    var delegate: DavidPageViewControllerDelegate?
    var index: Int = 0
    
    var itemViews: [UIView] = []
    var itemViewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraints()
    }
    
    private func configure() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        addChild(pageViewController)
    }
    
    private func addSubviews() {
        let subViews: [UIView] = [pageViewController.view, pageControl]
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func makeConstraints() {
        let views: [UIView] = [self.view, pageViewController.view, pageControl]
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints: [NSLayoutConstraint] = [
            pageViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            pageViewController.view.heightAnchor.constraint(equalTo: pageViewController.view.widthAnchor,
                                                            multiplier: 0.6),
            pageControl.topAnchor.constraint(equalTo: pageViewController.view.bottomAnchor,
                                             constant: 5),
            pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setItemViews(_ itemViews: [UIView]) {
        self.itemViews = itemViews
        self.itemViewControllers = itemViews.compactMap { view in
            let viewController = UIViewController()
            viewController.view = view
            return viewController
        }
        if let firstItemViewController = itemViewControllers.first {
            self.index = 0
            self.pageViewController.setViewControllers([firstItemViewController],
                                                       direction: .forward,
                                                       animated: true)
        }
        setPageControl()
    }
    
    private func setPageControl(){
        pageControl.numberOfPages = self.itemViewControllers.count
        pageControl.currentPage = index
        self.view.layoutIfNeeded()
    }
    
    @objc private func pageControlChanged(_ sender: UIPageControl) {
        guard let currentItemViewController = itemViewControllers[safe: sender.currentPage] else { return }
        let direction: UIPageViewController.NavigationDirection = self.index < sender.currentPage ? .forward : .reverse
        self.index = sender.currentPage
        self.pageViewController.setViewControllers([currentItemViewController],
                                                   direction: direction,
                                                   animated: true)
        self.pageChanged()
    }
    
    private func pageChanged() {
        delegate?.pageChanged(pageViewController: pageViewController,
                              pageControl: pageControl,
                              index: index)
    }
    
    @objc private func pageClicked() {
        delegate?.pageClicked(viewController: self,
                              index: index)
    }
}

extension DavidPageViewController: UIPageViewControllerDelegate,
                                   UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = itemViewControllers.firstIndex(of: viewController) else { return nil }
        return itemViewControllers[safe: index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = itemViewControllers.firstIndex(of: viewController) else { return nil }
        return itemViewControllers[safe: index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let firstPendingViewController = pendingViewControllers.first else { return }
        self.index = itemViewControllers.firstIndex(of: firstPendingViewController) ?? 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = self.index
            self.pageChanged()
        }
    }
}
