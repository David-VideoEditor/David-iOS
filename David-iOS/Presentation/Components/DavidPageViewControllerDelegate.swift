//
//  DavidPageViewControllerDelegate.swift
//  David-iOS
//
//  Created by 이전희 on 2023/07/27.
//

import UIKit

protocol DavidPageViewControllerDelegate {
    func pageChanged(pageViewController: UIPageViewController,
                     pageControl: UIPageControl,
                     index changedPage: Int)
    
    func pageClicked(viewController: UIViewController,
                     index clickedPage: Int)
}

extension DavidPageViewControllerDelegate {
    func pageChanged(pageViewController: UIPageViewController,
                     pageControl: UIPageControl,
                     index changedPage: Int) {
    }
    
    func pageClicked(viewController: UIViewController,
                     index clickedPage: Int) { }
}
