//
//  TargetDependencyGenerator.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 18.09.2022.
//

import Foundation
import ProjectDescription

protocol TargetDependencyGenerator {
    func createTargetDependency() -> TargetDependency
}
