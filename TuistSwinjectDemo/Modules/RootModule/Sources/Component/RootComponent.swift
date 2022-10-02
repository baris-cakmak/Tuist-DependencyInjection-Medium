import Foundation
import Swinject
import HomeModuleInterface
import LoginModuleInterface

public struct RootComponent {
    // MARK: - Properties
    let homeModule: HomeModuleInterface
    let loginModule: LoginModuleInterface
    // MARK: - Init
    public init(
        homeModule: HomeModuleInterface,
        loginModule: LoginModuleInterface
    ) {
        self.homeModule = homeModule
        self.loginModule = loginModule
    }
}
