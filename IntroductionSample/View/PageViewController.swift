//
//  PageViewController.swift
//  tryLoader
//
//  Created by Satyenkumar Mourya on 06/03/20.
//  Copyright © 2020 Satyenkumar Mourya. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var viewModel = PageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appBackgroundColor
        setupPageControl()
        dataSource = self
        delegate = self
        setViewControllers([viewModel.createSlideViewController(fromIndex: 0)], direction: .forward, animated: true)
    }
    
    func setupPageControl(){
        UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self]).currentPageIndicatorTintColor = UIColor.introTextColor
        UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self]).pageIndicatorTintColor = UIColor.pageTintColor
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return GlobalConstant.introScenes.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        var index: Int = 0
        for (location, scene) in GlobalConstant.introScenes.enumerated() {
            if let vc = pageViewController.children.first as? IntroductionViewController, vc.name == scene.name {
                index = location
            }
        }
        return index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        viewModel.getViewController(forViewController: viewController, isNextController: false)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        viewModel.getViewController(forViewController: viewController, isNextController: true)
    }
    
    
}
