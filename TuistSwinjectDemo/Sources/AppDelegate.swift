//
//  AppDelegate.swift
//  TuistSwinjectDemo
//
//  Created by Peace on 2.10.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        window = .init(frame: UIScreen.main.bounds)
        let navigationController: UINavigationController = .init()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
