import Foundation

// MARK: - LoginPresenterInterface
protocol LoginPresenterInterface {
    func goToHome()
}
// MARK: - LoginInteractorOutputInterface
protocol LoginInteractorOutputInterface: AnyObject {
}

final class LoginPresenter: LoginPresenterInterface {
    // MARK: - Properties
    private weak var view: LoginPresenterOutputInterface?
    private let interactor: LoginInteractorInterface?
    private let router: LoginRouterInterface?
    // MARK: - Init
    init(
        view: LoginPresenterOutputInterface?,
        interactor: LoginInteractorInterface?,
        router: LoginRouterInterface?
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func goToHome() {
        router?.navigateToHome()
    }
}
// MARK: - LoginInteractorOutputInterface
extension LoginPresenter: LoginInteractorOutputInterface {
}
