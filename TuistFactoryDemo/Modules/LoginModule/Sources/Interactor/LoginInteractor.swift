import Foundation
import JsonPlaceHolderKit

// MARK: - InteractorInterface
protocol LoginInteractorInterface {
}

final class LoginInteractor: LoginInteractorInterface {
    // MARK: - Properties
    weak var presenter: LoginInteractorOutputInterface?
    private let jsonPlaceHolderService: JSONPlaceholderServiceInterface?
    // MARK: - Init
    init(jsonPlaceHolderService: JSONPlaceholderServiceInterface?) {
        self.jsonPlaceHolderService = jsonPlaceHolderService
        
        self.jsonPlaceHolderService?.getPosts { result in
            switch result {
            case .success(let postModels):
                print(self, postModels.prefix(1))
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
