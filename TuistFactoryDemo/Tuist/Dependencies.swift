//
//  Dependencies.swift
//  Config
//
//  Created by Peace on 2.10.2022.
//

import ProjectDescriptionHelpers
import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init([
        .remote(
            url: "https://github.com/hmlongco/Factory.git",
            requirement: .upToNextMajor(from: "1.2.8")
        )
    ])
)
