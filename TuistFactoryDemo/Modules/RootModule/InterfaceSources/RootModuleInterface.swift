import UIKit
import Factory
import CoreModuleInterface

public protocol RootModuleInterface: ModuleInterface {
}

extension Container {
    public static var rootModule = Factory<RootModuleInterface?> {
        nil
    }
}
