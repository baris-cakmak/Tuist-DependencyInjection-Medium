import UIKit
import HomeModuleInterface

// MARK: - HomeRouterInterface
protocol HomeRouterInterface {
}
// MARK: - HomeModuleInterface
public final class HomeRouter: HomeModuleInterface {
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    private let homeComponent: HomeComponent
    // MARK: - Init
    public init(
        navigationController: UINavigationController? = nil,
        homeComponent: HomeComponent
        ) {
        self.navigationController = navigationController
        self.homeComponent = homeComponent
    }
    public func createModule(using navigationController: UINavigationController? = nil) -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: self)
        view.presenter = presenter
        interactor.presenter = presenter
        self.navigationController = navigationController
        return view
    }
}

// MARK: - HomeRouterInterface
extension HomeRouter: HomeRouterInterface {
}
