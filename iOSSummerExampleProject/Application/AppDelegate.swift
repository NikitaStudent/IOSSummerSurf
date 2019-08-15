//
//  AppDelegate.swift
//  iOSSummerExampleProject
//
//  Created by xcode on 06.08.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupCache()
        return true
    }
    
    private func setupCache() {
        let cache = URLCache.shared
        cache.diskCapacity = 1024 * 1024 * 50
        cache.memoryCapacity = 1024 * 1024 * 10
    }

}

