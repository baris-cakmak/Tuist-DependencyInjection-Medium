import UIKit
import HomeModuleInterface
import LoginModuleInterface
import Factory

// MARK: - HomeRouterInterface
protocol HomeRouterInterface {
    func navigateToLogin()
}
// MARK: - HomeModuleInterface
public final class HomeRouter: HomeModuleInterface {
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    // MARK: - Init
    public init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    public func createModule(using navigationController: UINavigationController? = nil) -> UIViewController {
        @Injected(Container.jsonPlaceHolderService) var jsonPlaceHolderService
        let view = HomeViewController()
        let interactor = HomeInteractor(jsonPlaceHolderService: jsonPlaceHolderService)
        let presenter = HomePresenter(view: view, interactor: interactor, router: self)
        view.presenter = presenter
        interactor.presenter = presenter
        self.navigationController = navigationController
        return view
    }
}

// MARK: - HomeRouterInterface
extension HomeRouter: HomeRouterInterface {
    func navigateToLogin() {
        guard let loginModule = Container.loginModule() else {
            return
        }
        let login = loginModule.createModule(using: navigationController)
        navigationController?.pushViewController(login, animated: true)
    }
}
