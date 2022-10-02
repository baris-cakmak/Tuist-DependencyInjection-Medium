import Foundation

// MARK: - LoginPresenterInterface
protocol LoginPresenterInterface {
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
}
// MARK: - LoginInteractorOutputInterface
extension LoginPresenter: LoginInteractorOutputInterface {
}
