//
//  Dependencies.swift
//  Config
//
//  Created by Peace on 2.10.2022.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init([
        .remote(
            url: "https://github.com/Swinject/Swinject.git",
            requirement: .upToNextMajor(from: "2.8.0")
        )
    ])
)

