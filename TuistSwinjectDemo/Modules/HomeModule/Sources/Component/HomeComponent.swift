import Foundation
import Swinject
import LoginModuleInterface
import JsonPlaceHolderKit

public struct HomeComponent {
    // MARK: - Properties
    let loginModule: LoginModuleInterface
    let jsonPlaceHolderService: JSONPlaceholderServiceInterface
    // MARK: - Init
    public init(
        loginModule: LoginModuleInterface,
        jsonPlaceHolderService: JSONPlaceholderServiceInterface
    ) {
        self.loginModule = loginModule
        self.jsonPlaceHolderService = jsonPlaceHolderService
    }
}
