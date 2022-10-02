import Foundation

// MARK: - RootPresenterInterface
protocol RootPresenterInterface {
    func goToHome()
}
// MARK: - RootInteractorOutputInterface
protocol RootInteractorOutputInterface: AnyObject {
}

final class RootPresenter: RootPresenterInterface {
    // MARK: - Properties
    private weak var view: RootPresenterOutputInterface?
    private let interactor: RootInteractorInterface?
    private let router: RootRouterInterface?
    // MARK: - Init
    init(
        view: RootPresenterOutputInterface?,
        interactor: RootInteractorInterface?,
        router: RootRouterInterface?
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func goToHome() {
        router?.navigateToHome()
    }
}
// MARK: - RootInteractorOutputInterface
extension RootPresenter: RootInteractorOutputInterface {
}
