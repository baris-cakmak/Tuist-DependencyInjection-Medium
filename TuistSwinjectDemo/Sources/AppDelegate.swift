//
//  AppDelegate.swift
//  TuistSwinjectDemo
//
//  Created by Peace on 2.10.2022.
//

import UIKit
import RootModuleInterface

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        let navigationController: UINavigationController = .init()
        DependencyContainer.shared.injectDependencies()
        guard let rootModule = DependencyContainer.shared.container.resolve(RootModuleInterface.self) else {
            fatalError("creation error")
        }
        let root = rootModule.createModule(using: navigationController)
        navigationController.setViewControllers([root], animated: true)
        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
