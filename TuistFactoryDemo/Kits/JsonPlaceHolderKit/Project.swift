import ProjectDescription
import ProjectDescriptionHelpers

private func makeDependencies() -> [TargetDependency] {
    var dependencies: [TargetDependency] = []
    dependencies.append(contentsOf: [
        AllDependencies.factory,
        AllDependencies.coreNetworkLayer,
        AllDependencies.common
    ])
    return dependencies
}

let project = Project.makeTarget(
    name: "JsonPlaceHolderKit",
    dependencies: makeDependencies()
)
