//
//  UIViewControllerExtensions.swift
//  HabitualTracker
//
//  Created by Jackson Ho on 11/25/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
