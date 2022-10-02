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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.goToHome()
        }
    }
}
// MARK: - PresenterOutputInterface
extension RootViewController: RootPresenterOutputInterface {
}
