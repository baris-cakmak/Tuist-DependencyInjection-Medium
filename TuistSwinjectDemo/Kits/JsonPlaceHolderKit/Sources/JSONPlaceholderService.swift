//
//  JSONPlaceholderService.swift
//  NeedleDemoo
//
//  Created by Peace on 1.09.2022.
//

import Foundation
import CoreNetworkLayer

public protocol JSONPlaceholderServiceInterface {
    func getPosts(completion: @escaping (Result<[PostModel], Error>) -> Void)
    func getComments(id: Int, completion: @escaping (Result<[PostModel], Error>) -> Void)
    func postPosts(title: String, body: String, userId: Int, completion: @escaping (Result<PostModel, Error>) -> Void)
}

public final class JSONPlaceholderService: JSONPlaceholderServiceInterface {
    // MARK: - Init
    public init() {
    }
    // MARK: - Method
    public func getPosts(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        apiRequest(JsonPlaceHolderEndpoint.getPosts, completion: completion)
    }
    
    public func getComments(id: Int, completion: @escaping (Result<[PostModel], Error>) -> Void) {
        apiRequest(JsonPlaceHolderEndpoint.comments(postId: id), completion: completion)
    }
    
    public func postPosts(title: String, body: String, userId: Int, completion: @escaping (Result<PostModel, Error>) -> Void) {
        apiRequest(JsonPlaceHolderEndpoint.post(title: title, body: body, userId: userId), completion: completion)
    }
}
// MARK: - Helper
extension JSONPlaceholderService {
    private func apiRequest<T: Decodable>(_ requestType: ServiceProtocol, completion: @escaping (Result<T, Error>) -> Void) {
        let session: URLSession = .shared
        let urlRequest = requestType.asURLRequest()
        session.dataTask(with: urlRequest) { data, _, error in
            NetworkLogger.log(request: urlRequest)
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "a", code: .zero)))
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
