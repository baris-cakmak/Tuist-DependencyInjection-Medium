import Foundation

// MARK: - RootInteractorInterface
protocol RootInteractorInterface {
}

final class RootInteractor: RootInteractorInterface {
    // MARK: - Properties
    weak var presenter: RootInteractorOutputInterface?
    // MARK: - Init
}
