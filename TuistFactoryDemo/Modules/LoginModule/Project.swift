import ProjectDescription
import ProjectDescriptionHelpers

private final class LoginModule: ModuleGenerator {
    func makeDependencies() -> [TargetDependency] {
        var dependencies: [TargetDependency] = []
        dependencies.append(contentsOf: [
            AllDependencies.homeModuleInterfaceTargetDependency,
            AllDependencies.loginModuleInterfaceTargetDependency
        ])
        return dependencies
    }
    func makeTargets() -> [Target] {
        var targets: [Target] = []
        targets.append(contentsOf: [
            AllDependencies.loginModuleInterfaceTarget
        ])
        return targets
    }
}
private let module = LoginModule()

let project = Project.makeTarget(
    name: String(describing: LoginModule.self),
    dependencies: module.makeDependencies(),
    targets: module.makeTargets()
)
