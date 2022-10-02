//
//  AllDependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 10.09.2022.
//

import ProjectDescription

// MARK: - Path Constants
public enum PathConstants {
    public static let modules: String = "Modules/"
    public static let kits: String = "Kits/"
    public static let coreModules: String = "CoreModules/"
    public static let scripts: String = "Scripts/"
}
// MARK: - Module Paths
private enum ModulePaths: String, UpperCaseble {
    case rootModule
    case homeModule
    case loginModule
    case testModule
    
    func createModuleTargetDependency() -> TargetDependency {
        .project(
            target: self.description,
            path: .relativeToRoot(PathConstants.modules.appending(self.description))
        )
    }
}
// MARK: - CoreModule Paths
private enum CoreModulePaths: String, UpperCaseble, TargetDependencyGenerator {
    case coreModuleInterface
    case coreNetworkLayer
    case common
    
    func createTargetDependency() -> TargetDependency {
        .project(
            target: description,
            path: .relativeToRoot(
                PathConstants.coreModules.appending(description)
            )
        )
    }
    
}
// MARK: - ModuleInterface Paths
private enum ModuleInterfacePaths: String, UpperCaseble, TargetDependencyGenerator {
    case homeModuleInterface
    case loginModuleInterface
    case rootModuleInterface
    case testModuleInterface

    func makeTarget() -> Target {
        .init(
            name: self.description,
            platform: .iOS,
            product: .staticFramework,
            bundleId: "bariscakmak.\(self.description)",
            infoPlist: .default,
            sources: [
                "InterfaceSources/**"
            ],
            dependencies: [
                AllDependencies.coreModuleInterface
            ]
        )
    }
    func createTargetDependency() -> TargetDependency {
        .project(
            target: self.description,
            path: .relativeToRoot(PathConstants.modules.appending(self.description).replacingOccurrences(of: "Interface", with: ""))
        )
    }
}
// MARK: - Kit Paths
private enum KitPaths: String, UpperCaseble {
    case jsonPlaceHolderKit

    func createTargetDependency() -> TargetDependency {
        .project(
            target: self.description,
            path: .relativeToRoot(PathConstants.kits.appending(self.description))
        )
    }
}
// MARK: - Swift Package Manager Packages
private enum SwiftPackageManagers: String {
//    case needleFoundation
    case swinject
    
    var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
    func createTargetDependency() -> TargetDependency {
        .external(name: self.description)
    }
}
// MARK: - All Dependencies
public enum AllDependencies: CaseIterable {
    // MARK: - CoreModules
    public static let coreModuleInterface: TargetDependency = CoreModulePaths.coreModuleInterface.createTargetDependency()
    public static let coreNetworkLayer: TargetDependency = CoreModulePaths.coreNetworkLayer.createTargetDependency()
    public static let common: TargetDependency = CoreModulePaths.common.createTargetDependency()
    // MARK: - Modules
    public static let rootModule: TargetDependency = ModulePaths.rootModule.createModuleTargetDependency()
    public static let homeModule: TargetDependency = ModulePaths.homeModule.createModuleTargetDependency()
    public static let loginModule: TargetDependency = ModulePaths.loginModule.createModuleTargetDependency()
    public static let testModule: TargetDependency = ModulePaths.testModule.createModuleTargetDependency()
    // MARK: - ModuleInterfaceTargets
    public static let homeModuleInterfaceTarget: Target = ModuleInterfacePaths.homeModuleInterface.makeTarget()
    public static let loginModuleInterfaceTarget: Target = ModuleInterfacePaths.loginModuleInterface.makeTarget()
    public static let rootModuleInterfaceTarget: Target = ModuleInterfacePaths.rootModuleInterface.makeTarget()
    public static let testModuleInterfaceTarget: Target = ModuleInterfacePaths.testModuleInterface.makeTarget()
    // MARK: - ModuleInterfaceTargetDependencies
    public static let homeModuleInterfaceTargetDependency: TargetDependency = ModuleInterfacePaths.homeModuleInterface.createTargetDependency()
    public static let loginModuleInterfaceTargetDependency: TargetDependency = ModuleInterfacePaths.loginModuleInterface.createTargetDependency()
    public static let rootModuleInterfaceTargetDependency: TargetDependency = ModuleInterfacePaths.rootModuleInterface.createTargetDependency()
    public static let testModuleInterfaceTargetDependency: TargetDependency = ModuleInterfacePaths.testModuleInterface.createTargetDependency()
    // MARK: - Kits
    public static let jsonPlaceHolderKit: TargetDependency = KitPaths.jsonPlaceHolderKit.createTargetDependency()
    // MARK: - Swift Package Managers
    public static let swinject: TargetDependency = SwiftPackageManagers.swinject.createTargetDependency()
}


