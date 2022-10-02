//
//  ServiceLocatorEngine.swift
//  TuistFactoryDemo
//
//  Created by Peace on 2.10.2022.
//

import Foundation
import RootModule
import RootModuleInterface
import Factory

final class ServiceLocatorEngine {
    func injectDependencies() {
        Container.rootModule.register {
            RootRouter()
        }
    }
}
