import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin
 
// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

private func makeDependencies() -> [TargetDependency] {
    var dependencies: [TargetDependency] = []
    dependencies.append(contentsOf: [
        AllDependencies.factory,
        AllDependencies.jsonPlaceHolderKit,
        AllDependencies.rootModule,
        AllDependencies.homeModule,
        AllDependencies.loginModule
    ])
    return dependencies
}

let infoPlist: [String: InfoPlist.Value] = [
    "UILaunchScreen": [:]
]
let target = Target(
    name: "TuistFactoryDemo",
    platform: .iOS,
    product: .app,
    bundleId: "com.bariscakmak.TuistFactoryDemo",
    infoPlist: .extendingDefault(with: infoPlist),
    sources: [
        "Sources/**"
    ],
    scripts: [
        .pre(path: ScriptPaths.swiftlint.path, name: "Run Swiftlint")
    ],
    dependencies: makeDependencies()
)
let project = Project(
    name: "TuistFactoryDemo",
    targets: [target]
)
