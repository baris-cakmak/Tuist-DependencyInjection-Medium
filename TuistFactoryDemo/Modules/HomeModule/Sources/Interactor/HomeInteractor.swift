import Foundation
import JsonPlaceHolderKit

// MARK: - InteractorInterface
protocol HomeInteractorInterface {
}

final class HomeInteractor: HomeInteractorInterface {
    // MARK: - Properties
    weak var presenter: HomeInteractorOutputInterface?
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
