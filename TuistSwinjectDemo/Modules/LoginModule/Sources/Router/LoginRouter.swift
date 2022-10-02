import UIKit
import LoginModuleInterface

// MARK: - LoginRouterInterface
protocol LoginRouterInterface {
    func navigateToHome()
}
// MARK: - LoginModuleInterface
public final class LoginRouter: LoginModuleInterface {
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    private let loginComponent: LoginComponent
    // MARK: - Init
    public init(
        navigationController: UINavigationController? = nil,
        loginComponent: LoginComponent
        ) {
        self.navigationController = navigationController
        self.loginComponent = loginComponent
    }
    public func createModule(using navigationController: UINavigationController? = nil) -> UIViewController {
        let view = LoginViewController()
        let interactor = LoginInteractor()
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
        let home = loginComponent.homeModule.instance.createModule(using: navigationController)
        navigationController?.pushViewController(home, animated: true)
    }
}
