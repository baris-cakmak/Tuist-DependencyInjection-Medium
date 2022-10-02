import UIKit
import Factory
import CoreModuleInterface

public protocol HomeModuleInterface: ModuleInterface {
}

extension Container {
    public static var homeModule = Factory<HomeModuleInterface?> {
        nil
    }
}
