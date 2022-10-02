import UIKit
import RootModuleInterface
import HomeModuleInterface
import Factory

// MARK: - RootRouterInterface
protocol RootRouterInterface {
    func navigateToHome()
}
// MARK: - RootModuleInterface
public final class RootRouter: RootModuleInterface {
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    // MARK: - Init
    public init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    public func createModule(using navigationController: UINavigationController? = nil) -> UIViewController {
        let view = RootViewController()
        let interactor = RootInteractor()
        let presenter = RootPresenter(view: view, interactor: interactor, router: self)
        view.presenter = presenter
        interactor.presenter = presenter
        self.navigationController = navigationController
        return view
    }
}

// MARK: - RootRouterInterface
extension RootRouter: RootRouterInterface {
    func navigateToHome() {
        guard let homeModule = Container.homeModule() else {
            return
        }
        let home = homeModule.createModule(using: navigationController)
        navigationController?.pushViewController(home, animated: true)
    }
}
