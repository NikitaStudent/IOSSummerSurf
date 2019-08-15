//
//  CustomNavigationController.swift
//  iOSSummerExampleProject
//
//  Created by Alexander Filimonov on 12/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

}
