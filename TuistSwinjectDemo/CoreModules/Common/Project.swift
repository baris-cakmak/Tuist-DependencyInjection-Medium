import ProjectDescription
import ProjectDescriptionHelpers

private final class Common: ModuleGenerator {
    func makeDependencies() -> [TargetDependency] {
        var dependencies: [TargetDependency] = []
        dependencies.append(contentsOf: [
        ])
        return dependencies
    }
}

private let common = Common()
let project = Project.makeTarget(
    name: String(describing: Common.self),
    dependencies: common.makeDependencies()
)

