import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let infoPlist: [String: InfoPlist.Value] = [
    "UILaunchScreen": [:]
]

private func makeDependencies() -> [TargetDependency] {
    var dependencies: [TargetDependency] = []
    dependencies.append(contentsOf: [
        AllDependencies.rootModule,
        AllDependencies.homeModule,
        AllDependencies.loginModule,
        AllDependencies.jsonPlaceHolderKit,
        AllDependencies.swinject
    ])
    return dependencies
}
let project = Project(name: "TuistSwinjectDemo", targets: [
    .init(
        name: "TuistSwinjectDemo",
        platform: .iOS,
        product: .app,
        bundleId: "bariscakmak.TuistSwinjectDemo",
        infoPlist: .extendingDefault(with: infoPlist),
        sources: ["Sources/**"],
        scripts: [
            .pre(path: ScriptPaths.swiftlint.path, name: "Run Swiftlint")
        ],
        dependencies: makeDependencies()
    )
])
