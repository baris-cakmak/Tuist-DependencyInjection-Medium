//
//  TargetDependencyGenerator.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 24.09.2022.
//

import ProjectDescription

protocol TargetDependencyGenerator {
    func createTargetDependency() -> TargetDependency
}

