//
//  AppDelegate.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 24.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let context = Context()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let initial = (window?.rootViewController as? UINavigationController)?.viewControllers.first {
            PackagesModuleConfigurator.configureModuleFor(viewInput: initial, context: context, output: nil)
        }
        return true
    }

}

