//
//  ScriptPaths.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 18.09.2022.
//

import ProjectDescription

public enum ScriptPaths: String {
    case swiftlint
    
    public var path: Path {
        .relativeToRoot(PathConstants.scripts.appending(rawValue).appending(".sh"))
    }
}

