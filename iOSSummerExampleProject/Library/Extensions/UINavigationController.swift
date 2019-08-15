//
//  UINavigationController.swift
//  iOSSummerExampleProject
//
//  Created by Alexander Filimonov on 12/08/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

extension UINavigationController {

    func designTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = .clear
        navigationBar.tintColor = .white
    }

    func designDark() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

}
