import Foundation

// MARK: - HomeInteractorInterface
protocol HomeInteractorInterface {
}

final class HomeInteractor: HomeInteractorInterface {
    // MARK: - Properties
    weak var presenter: HomeInteractorOutputInterface?
    // MARK: - Init
}
