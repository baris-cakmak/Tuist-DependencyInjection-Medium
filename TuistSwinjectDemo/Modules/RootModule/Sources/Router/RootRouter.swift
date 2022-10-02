import UIKit
import RootModuleInterface

// MARK: - RootRouterInterface
protocol RootRouterInterface {
}
// MARK: - RootModuleInterface
public final class RootRouter: RootModuleInterface {
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    private let rootComponent: RootComponent
    // MARK: - Init
    public init(
        navigationController: UINavigationController? = nil,
        rootComponent: RootComponent
        ) {
        self.navigationController = navigationController
        self.rootComponent = rootComponent
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
}
