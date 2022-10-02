import UIKit
import LoginModuleInterface
import HomeModuleInterface
import Factory

// MARK: - LoginRouterInterface
protocol LoginRouterInterface {
    func navigateToHome()
}
// MARK: - LoginModuleInterface
public final class LoginRouter: LoginModuleInterface {
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    // MARK: - Init
    public init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    public func createModule(using navigationController: UINavigationController? = nil) -> UIViewController {
        @Injected(Container.jsonPlaceHolderService) var jsonPlaceHolderService
        let view = LoginViewController()
        let interactor = LoginInteractor(jsonPlaceHolderService: jsonPlaceHolderService)
        let presenter = LoginPresenter(view: view, interactor: interactor, router: self)
        view.presenter = presenter
        interactor.presenter = presenter
        self.navigationController = navigationController
        return view
    }
}

// MARK: - LoginRouterInterface
extension LoginRouter: LoginRouterInterface {
    func navigateToHome() {
        guard let homeModule = Container.homeModule() else {
            return
        }
        let home = homeModule.createModule(using: navigationController)
        navigationController?.pushViewController(home, animated: true)
    }
}
