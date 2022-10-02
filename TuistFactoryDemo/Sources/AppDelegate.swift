//
//  AppDelegate.swift
//  TuistFactoryDemo
//
//  Created by Peace on 2.10.2022.
//

import UIKit
import Factory
import RootModuleInterface

@UIApplicationMain

final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        let serviceLocatorEngine = ServiceLocatorEngine()
        serviceLocatorEngine.injectDependencies()
        guard let rootModule = Container.rootModule() else {
            fatalError("Root Module Has not Registered")
        }
        let navigationController: UINavigationController = .init()
        let rootViewController = rootModule.createModule(using: navigationController)
        navigationController.setViewControllers([rootViewController], animated: true)
        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
