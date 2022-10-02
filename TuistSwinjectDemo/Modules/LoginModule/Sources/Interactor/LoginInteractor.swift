import Foundation

// MARK: - LoginInteractorInterface
protocol LoginInteractorInterface {
}

final class LoginInteractor: LoginInteractorInterface {
    // MARK: - Properties
    weak var presenter: LoginInteractorOutputInterface?
    // MARK: - Init
}
