//
//  PageViewModel.swift
//  Learn
//
//  Created by Satyenkumar Mourya on 06/03/20.
//  Copyright © 2020 Satyenkumar Mourya. All rights reserved.
//

import Foundation
import UIKit

public class PageViewModel {
    
    func getViewController(forViewController vc: UIViewController, isNextController: Bool) -> UIViewController? {
        guard let vc = vc as? IntroductionViewController else { return nil }
        var index: Int = 0
        for (location, scene) in GlobalConstant.introScenes.enumerated() {
            if scene.name == vc.name {
                index = location
            }
        }
        isNextController ? (index += 1) : (index -= 1)
        if isNextController {
            if GlobalConstant.introScenes.count > index {
                return createSlideViewController(fromIndex: index)
            }else{
                return nil
            }
        }else{
            if index >= 0 {
                return createSlideViewController(fromIndex: index)
            }else{
                return nil
            }
        }
    }
    
    func createSlideViewController(fromIndex index: Int) -> UIViewController {
        let screen = GlobalConstant.introScenes[index]
        let viewController = UIStoryboard(name: screen.storyBoardName, bundle: nil).instantiateViewController(identifier: screen.viewControllerName)
        (viewController as? IntroductionViewController)?.name = screen.name
        (viewController as? IntroductionViewController)?.animationName = screen.animationName
        (viewController as? IntroductionViewController)?.titleText = screen.mainTitle
        return viewController
    }
    
}
