import UIKit

// MARK: - PresenterOutputInterface
protocol HomePresenterOutputInterface: AnyObject {
}
final class HomeViewController: UIViewController {
    // MARK: - Properties
    var presenter: HomePresenterInterface?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HomeViewController"
    }
}
// MARK: - PresenterOutputInterface
extension HomeViewController: HomePresenterOutputInterface {
}
