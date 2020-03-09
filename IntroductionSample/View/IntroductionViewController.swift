//
//  ViewController.swift
//  tryLoader
//
//  Created by Satyenkumar Mourya on 01/03/20.
//  Copyright © 2020 Satyenkumar Mourya. All rights reserved.
//

import UIKit
import Lottie

class IntroductionViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var name: String?
    var animationName: String?
    var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        animationView.animation = Animation.named(animationName ?? "carrot")
        animationView.loopMode = .loop
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationView.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        animationView.stop()
    }
    
}

