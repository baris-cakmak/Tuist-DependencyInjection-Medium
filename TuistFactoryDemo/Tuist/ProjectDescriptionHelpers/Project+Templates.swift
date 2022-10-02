import ProjectDescription

extension Project {
    public static func makeTarget(
        name: String,
        hasResources: Bool = false,
        dependencies: [TargetDependency],
        hasUnitTest: Bool = false,
        hasUITest: Bool = false,
        targets: [Target] = [],
        unitTestsDependencies: [TargetDependency] = []
    ) -> Self {
        var allTargets: [Target] = []
        allTargets.append(contentsOf: targets)
        let sources = Target(
            name: name,
            platform: .iOS,
            product: .staticFramework,
            bundleId: "bariscakmak.\(name)",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: hasResources ? "Resources/**" : nil,
            dependencies: dependencies
        )
        allTargets.append(contentsOf: [
            sources
        ])
        
        return .init(
            name: name,
            targets: allTargets
        )
    }
}

