//
//  ModuleGenerator.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 18.09.2022.
//

import Foundation
import ProjectDescription

public protocol ModuleGenerator {
    func makeDependencies() -> [TargetDependency]
    func makeTargets() -> [Target]
}
extension ModuleGenerator {
    public func makeTargets() -> [Target] {
        return []
    }
}
