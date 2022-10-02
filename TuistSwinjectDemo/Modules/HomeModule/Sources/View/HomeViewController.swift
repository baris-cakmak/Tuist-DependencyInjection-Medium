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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.goToLogin()
        }
    }
}
// MARK: - PresenterOutputInterface
extension HomeViewController: HomePresenterOutputInterface {
}
