import ProjectDescription
import ProjectDescriptionHelpers

private final class RootModule: ModuleGenerator {
    func makeDependencies() -> [TargetDependency] {
        var dependencies: [TargetDependency] = []
        dependencies.append(contentsOf: [
            AllDependencies.rootModuleInterfaceTargetDependency,
            AllDependencies.homeModuleInterfaceTargetDependency,
            AllDependencies.loginModuleInterfaceTargetDependency,
            AllDependencies.swinject
        ])
        return dependencies
    }
    func makeTargets() -> [Target] {
        var targets: [Target] = []
        targets.append(contentsOf: [
            AllDependencies.rootModuleInterfaceTarget
        ])
        return targets
    }
}
private let module = RootModule()

let project = Project.makeTarget(
    name: String(describing: RootModule.self),
    dependencies: module.makeDependencies(),
    targets: module.makeTargets()
)
