//
//  AppDelegate.swift
//  IOS-Calculator
//
//  Created by Susana Santos Moreno on 23/06/2019.
//  Copyright © 2019 Susana Santos Moreno. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Setup
        setupView()
        print("Application did finish launching")
        return true
    }

    //MARK: - Private Methods

    private func setupView(){

        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

