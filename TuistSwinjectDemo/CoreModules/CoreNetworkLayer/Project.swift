import ProjectDescription
import ProjectDescriptionHelpers

private final class CoreNetworkLayer: ModuleGenerator {
    func makeDependencies() -> [TargetDependency] {
        var dependencies: [TargetDependency] = []
        dependencies.append(contentsOf: [
        ])
        return dependencies
    }
}

private let coreNetworkLayer = CoreNetworkLayer()
let project = Project.makeTarget(
    name: String(describing: CoreNetworkLayer.self),
    dependencies: coreNetworkLayer.makeDependencies()
)


