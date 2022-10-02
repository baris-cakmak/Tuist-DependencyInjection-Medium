import Foundation
import Swinject
import HomeModuleInterface
import LoginModuleInterface

public struct RootComponent {
    // MARK: - Properties
    let homeModule: Lazy<HomeModuleInterface>
    let loginModule: Lazy<LoginModuleInterface>
    // MARK: - Init
    public init(
        homeModule: Lazy<HomeModuleInterface>,
        loginModule: Lazy<LoginModuleInterface>
    ) {
        self.homeModule = homeModule
        self.loginModule = loginModule
    }
}
