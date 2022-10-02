import UIKit
import Factory
import CoreModuleInterface

public protocol LoginModuleInterface: ModuleInterface {
}

extension Container {
    public static var loginModule = Factory<LoginModuleInterface?> {
        nil
    }
}
