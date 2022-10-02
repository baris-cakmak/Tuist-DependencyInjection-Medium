import ProjectDescription
import ProjectDescriptionHelpers

private final class CoreModuleInterface: ModuleGenerator {
    func makeDependencies() -> [TargetDependency] {
        var dependencies: [TargetDependency] = []
        dependencies.append(contentsOf: [
        ])
        return dependencies
    }
}
private let coreModuleInterface = CoreModuleInterface()
let project = Project.makeTarget(name: "CoreModuleInterface", dependencies: coreModuleInterface.makeDependencies())
