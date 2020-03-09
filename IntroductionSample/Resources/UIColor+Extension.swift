//
//  UIColor+Extension.swift
//  Learn
//
//  Created by Satyenkumar Mourya on 06/03/20.
//  Copyright © 2020 Satyenkumar Mourya. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public class var appBackgroundColor: UIColor { UIColor(named : "appBackgroundColor") ?? UIColor.white }
    public class var introTextColor: UIColor { UIColor(named : "introTextColor") ?? UIColor.white }
    public class var pageTintColor: UIColor { UIColor(named : "pageTintColor") ?? UIColor.white }
}
