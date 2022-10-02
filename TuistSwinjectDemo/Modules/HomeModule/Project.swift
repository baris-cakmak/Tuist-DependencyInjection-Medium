import ProjectDescription
import ProjectDescriptionHelpers

private final class HomeModule: ModuleGenerator {
    func makeDependencies() -> [TargetDependency] {
        var dependencies: [TargetDependency] = []
        dependencies.append(contentsOf: [
            AllDependencies.homeModuleInterfaceTargetDependency,
            AllDependencies.swinject
        ])
        return dependencies
    }
    func makeTargets() -> [Target] {
        var targets: [Target] = []
        targets.append(contentsOf: [
            AllDependencies.homeModuleInterfaceTarget
        ])
        return targets
    }
}
private let module = HomeModule()

let project = Project.makeTarget(
    name: String(describing: HomeModule.self),
    dependencies: module.makeDependencies(),
    targets: module.makeTargets()
)
