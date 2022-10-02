import Foundation

// MARK: - HomePresenterInterface
protocol HomePresenterInterface {
    func goToLogin()
}
// MARK: - HomeInteractorOutputInterface
protocol HomeInteractorOutputInterface: AnyObject {
}

final class HomePresenter: HomePresenterInterface {
    // MARK: - Properties
    private weak var view: HomePresenterOutputInterface?
    private let interactor: HomeInteractorInterface?
    private let router: HomeRouterInterface?
    // MARK: - Init
    init(
        view: HomePresenterOutputInterface?,
        interactor: HomeInteractorInterface?,
        router: HomeRouterInterface?
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func goToLogin() {
        router?.navigateToLogin()
    }
}
// MARK: - HomeInteractorOutputInterface
extension HomePresenter: HomeInteractorOutputInterface {
}
