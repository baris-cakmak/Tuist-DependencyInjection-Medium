import UIKit

// MARK: - PresenterOutputInterface
protocol RootPresenterOutputInterface: AnyObject {
}
final class RootViewController: UIViewController {
    // MARK: - Properties
    var presenter: RootPresenterInterface?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RootViewController"
    }
}
// MARK: - PresenterOutputInterface
extension RootViewController: RootPresenterOutputInterface {
}
