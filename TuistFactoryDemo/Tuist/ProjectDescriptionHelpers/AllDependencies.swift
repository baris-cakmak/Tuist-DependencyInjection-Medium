//
//  AllDependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 13.09.2022.
//

import Foundation
import ProjectDescription

// MARK: - Path Constants
public enum PathConstants {
    public static let modules: String = "Modules/"
    public static let kits: String = "Kits/"
    public static let coreModules: String = "CoreModules/"
    public static let scripts: String = "Scripts/"
}
// MARK: - Module Paths
private enum ModulePaths: String, UpperCaseble, TargetDependencyGenerator {
    case rootModule
    case homeModule
    case loginModule
    
    func createTargetDependency() -> TargetDependency {
        .project(
            target: description,
            path: .relativeToRoot(PathConstants.modules.appending(description))
        )
    }
}
// MARK: - ModuleInterface Paths
private enum ModuleInterfacePaths: String, UpperCaseble {
    case homeModuleInterface
    case loginModuleInterface
    case rootModuleInterface
    
    var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
    func makeTarget() -> Target {
        .init(
            name: description,
            platform: .iOS,
            product: .staticFramework,
            bundleId: "bariscakmak.\(description)",
            infoPlist: .default,
            sources: [
                "InterfaceSources/**"
            ],
            dependencies: [
                AllDependencies.factory,
                AllDependencies.coreModuleInterface
            ]
        )
    }
    func createTargetDependency() -> TargetDependency {
        .project(
            target: description,
            path: .relativeToRoot(PathConstants.modules.appending(description).replacingOccurrences(of: "Interface", with: ""))
        )
    }
}
// MARK: - CoreModule Paths
private enum CoreModulePaths: String, UpperCaseble {
    case coreModuleInterface
    case coreNetworkLayer
    case common

    func createTargetDependency() -> TargetDependency {
        .project(
            target: description,
            path: .relativeToRoot(PathConstants.coreModules.appending(description))
        )
    }
}
// MARK: - Kit Paths
private enum KitPaths: String, UpperCaseble {
    case jsonPlaceHolderKit
    case moduleInterfaceKit

    func createTargetDependency() -> TargetDependency {
        .project(
            target: description,
            path: .relativeToRoot(PathConstants.kits.appending(description))
        )
    }
}
// MARK: - Swift Package Manager Packages
private enum SwiftPackageManagers: String, UpperCaseble {
    case factory
    
    func createTargetDependency() -> TargetDependency {
        .external(name: description)
    }
}
// MARK: - All Dependencies
public enum AllDependencies: CaseIterable {
    // MARK: - Modules
    public static let rootModule: TargetDependency = ModulePaths.rootModule.createTargetDependency()
    public static let homeModule: TargetDependency = ModulePaths.homeModule.createTargetDependency()
    public static let loginModule: TargetDependency = ModulePaths.loginModule.createTargetDependency()
    // MARK: - ModuleInterfaceTargets
    public static let homeModuleInterfaceTarget: Target = ModuleInterfacePaths.homeModuleInterface.makeTarget()
    public static let loginModuleInterfaceTarget: Target = ModuleInterfacePaths.loginModuleInterface.makeTarget()
    public static let rootModuleInterfaceTarget: Target = ModuleInterfacePaths.rootModuleInterface.makeTarget()
    // MARK: - ModuleInterfaceTargetDependencies
    public static let homeModuleInterfaceTargetDependency: TargetDependency = ModuleInterfacePaths.homeModuleInterface.createTargetDependency()
    public static let loginModuleInterfaceTargetDependency: TargetDependency = ModuleInterfacePaths.loginModuleInterface.createTargetDependency()
    public static let rootModuleInterfaceTargetDependency: TargetDependency = ModuleInterfacePaths.rootModuleInterface.createTargetDependency()
    // MARK: - Kits
    public static let jsonPlaceHolderKit: TargetDependency = KitPaths.jsonPlaceHolderKit.createTargetDependency()
    public static let moduleInterfaceKit: TargetDependency = KitPaths.moduleInterfaceKit.createTargetDependency()
    // MARK: - CoreModules
    public static let coreModuleInterface: TargetDependency = CoreModulePaths.coreModuleInterface.createTargetDependency()
    public static let coreNetworkLayer: TargetDependency = CoreModulePaths.coreNetworkLayer.createTargetDependency()
    public static let common: TargetDependency = CoreModulePaths.common.createTargetDependency()
    // MARK: - Swift Package Managers
    public static let factory: TargetDependency = SwiftPackageManagers.factory.createTargetDependency()
}
