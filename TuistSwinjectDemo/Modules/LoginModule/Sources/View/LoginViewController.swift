import UIKit

// MARK: - PresenterOutputInterface
protocol LoginPresenterOutputInterface: AnyObject {
}
final class LoginViewController: UIViewController {
    // MARK: - Properties
    var presenter: LoginPresenterInterface?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LoginViewController"
    }
}
// MARK: - PresenterOutputInterface
extension LoginViewController: LoginPresenterOutputInterface {
}
