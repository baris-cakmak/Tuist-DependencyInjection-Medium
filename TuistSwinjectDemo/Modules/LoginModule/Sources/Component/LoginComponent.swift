import Foundation
import Swinject
import HomeModuleInterface
import JsonPlaceHolderKit

public struct LoginComponent {
    // MARK: - Properties
    let homeModule: Lazy<HomeModuleInterface>
    let jsonPlaceHolderService: JSONPlaceholderServiceInterface
    // MARK: - Init
    public init(
        homeModule: Lazy<HomeModuleInterface>,
        jsonPlaceHolderService: JSONPlaceholderServiceInterface
    ) {
        self.homeModule = homeModule
        self.jsonPlaceHolderService = jsonPlaceHolderService
    }
}
