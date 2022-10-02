import ProjectDescription
import ProjectDescriptionHelpers

private func makeDependencies() -> [TargetDependency] {
    var dependencies: [TargetDependency] = []
    dependencies.append(contentsOf: [
    ])
    return dependencies
}

let project = Project.makeTarget(
    name: "Common",
    dependencies: makeDependencies()
)
