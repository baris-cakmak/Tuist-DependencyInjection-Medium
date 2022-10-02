//
//  ModuleInterface.swift
//  CoreModuleInterface
//
//  Created by Peace on 18.09.2022.
//

import UIKit

public protocol ModuleInterface {
    func createModule(using navigationController: UINavigationController?) -> UIViewController
}
