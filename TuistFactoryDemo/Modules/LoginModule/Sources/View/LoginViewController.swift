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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.goToHome()
        }
    }
}
// MARK: - PresenterOutputInterface
extension LoginViewController: LoginPresenterOutputInterface {
}
