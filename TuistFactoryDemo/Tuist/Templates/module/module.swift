//
//  module.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 18.09.2022.
//

import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

let moduleNameAttribute: Template.Attribute = .required("name")

private let sources = PathConstants.modules.appending("\(moduleNameAttribute)Module/Sources/")


let moduleTemplate: Template = .init(
    description: "A template for creating viper",
    attributes: [moduleNameAttribute],
    items: [
        .file(
            path: sources.appending("View/\(moduleNameAttribute)ViewController.swift") ,
            templatePath: "View.stencil"
        ),
        .file(
            path: sources.appending("Presenter/\(moduleNameAttribute)Presenter.swift"),
            templatePath: "Presenter.stencil"
        ),
        .file(
            path: PathConstants.modules
                .appending("\(moduleNameAttribute)Module/Project.swift"),
            templatePath: "MakeProject.stencil"
        ),
        .file(
            path: PathConstants.modules.appending("\(moduleNameAttribute)Module/InterfaceSources/\(moduleNameAttribute)ModuleInterface.swift"),
            templatePath: "MakeInterfaceSources.stencil"
        ),
        .file(
            path: sources.appending("Interactor/\(moduleNameAttribute)Interactor.swift"),
            templatePath: "Interactor.stencil"
        ),
        .file(
            path: sources.appending("Router/\(moduleNameAttribute)Router.swift"),
            templatePath: "Router.stencil"
        ),
    ]
)
