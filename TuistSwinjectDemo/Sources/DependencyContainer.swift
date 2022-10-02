//
//  DependencyContainer.swift
//  TuistSwinjectDemo
//
//  Created by Peace on 2.10.2022.
//

import Foundation
import RootModule
import RootModuleInterface
import HomeModule
import HomeModuleInterface
import LoginModule
import LoginModuleInterface
import JsonPlaceHolderKit
import Swinject

// swiftlint: disable force_unwrapping
final class DependencyContainer {
    static let shared = DependencyContainer()
    let container = Container()
    private init() {}
}
// MARK: - Method
extension DependencyContainer {
    func injectDependencies() {
        registerRootModuleDependencies()
        registerHomeModuleDependencies()
        registerLoginModuleDependencies()
        registerJsonPlaceHolderServiceDependencies()
    }
}
// MARK: - RootDependencies
extension DependencyContainer {
    private func registerRootModuleDependencies() {
        container.register(RootModuleInterface.self) { resolver in
            RootRouter(
                rootComponent: .init(
                    homeModule: resolver.resolve(Lazy<HomeModuleInterface>.self)!,
                    loginModule: resolver.resolve(Lazy<LoginModuleInterface>.self)!
                )
            )
        }
        .inObjectScope(.transient)
    }
}
// MARK: - HomeDependencies
extension DependencyContainer {
    private func registerHomeModuleDependencies() {
        container.register(HomeModuleInterface.self) { resolver in
            HomeRouter(
                homeComponent: .init(
                    loginModule: resolver.resolve(Lazy<LoginModuleInterface>.self)!,
                    jsonPlaceHolderService: resolver.resolve(JSONPlaceholderServiceInterface.self)!
                )
            )
        }
        .inObjectScope(.transient)
    }
}
// MARK: - LoginDependencies
extension DependencyContainer {
    private func registerLoginModuleDependencies() {
        container.register(LoginModuleInterface.self) { resolver in
            LoginRouter(
                loginComponent: .init(
                    homeModule: resolver.resolve(Lazy<HomeModuleInterface>.self)!,
                    jsonPlaceHolderService: resolver.resolve(JSONPlaceholderServiceInterface.self)!
                )
            )
        }
        .inObjectScope(.transient)
    }
}
// MARK: - JsonPlaceHolderService
extension DependencyContainer {
    private func registerJsonPlaceHolderServiceDependencies() {
        container.register(JSONPlaceholderServiceInterface.self) { _ in
            JSONPlaceholderService()
        }
        .inObjectScope(.transient)
    }
}
