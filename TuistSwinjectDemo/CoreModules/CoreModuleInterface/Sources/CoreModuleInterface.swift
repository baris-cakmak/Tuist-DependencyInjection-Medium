//
//  CoreModuleInterface.swift
//  CoreModuleInterface
//
//  Created by Peace on 24.09.2022.
//

import UIKit

public protocol CoreModuleInterface {
    func createModule(using navigationController: UINavigationController?) -> UIViewController
}
