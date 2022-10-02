//
//  EndPoint.swift
//  NetworkLayerDemo
//
//  Created by Peace on 16.07.2022.
//

import Foundation
import Common
import CoreNetworkLayer

enum JsonPlaceHolderEndpoint: ServiceProtocol {    
    case getPosts
    case comments(postId: Int)
    case post(title: String, body: String, userId: Int)
}
extension JsonPlaceHolderEndpoint {
    var baseURL: URL {
        return .string("https://jsonplaceholder.typicode.com")
    }
    var path: String {
        switch self {
        case .getPosts:
            return "posts"
        case .comments:
            return "comments"
        case .post:
            return "posts"
        }
    }
    var parameters: Parameters? {
        switch self {
        case .getPosts:
           return nil
        case .comments(let postId):
            return ["postId": postId]
        case .post(let title, let body, let userId):
            return ["title": title, "body": body, "userId": userId]
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        case .comments:
            return .get
        case .post:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .getPosts:
            return .requestPlain
        case .comments(let postId):
            return .requestParameters(["postId": postId])
        case .post(let title, let body, let userId):
            return .requestParameters(["title": title, "body": body, "userId": userId])
        }
    }
}



//class PlaceholderTest: NSObject, URLSessionDelegate, URLSessionDataDelegate {
//    
//    func getPosts(completion: @escaping (Result<[PostModel], Error>) -> Void) {
//        apiRequest(MovieApi.getPosts, completion: completion)
//    }
//    func getComments(id: Int, completion: @escaping (Result<[PostModel], Error>) -> Void) {
//        apiRequest(MovieApi.comments(postId: id), completion: completion)
//    }
//    func postPosts(title: String, body: String, userId: Int, completion: @escaping (Result<PostModel, Error>) -> Void) {
//        apiRequest(MovieApi.post(title: title, body: body, userId: userId), completion: completion)
//    }
//    
//    private func apiRequest<T: Decodable>(_ requestType: ServiceProtocol, completion: @escaping (Result<T,Error>) -> Void) {
//        let session = URLSession.init(configuration: .default, delegate: self, delegateQueue: .main)
//        let urlRequest = requestType.asURLRequest()
//        session.dataTask(with: urlRequest) { data, response, error in
//            NetworkLogger.log(request: urlRequest)
//            if let error = error {
//                completion(.failure(error))
//            }
//            guard let data = data else {
//                completion(.failure(NSError(domain: "a", code: .zero)))
//                return
//            }
//            let model = try! JSONDecoder().decode(T.self, from: data)
//            completion(.success(model))
//            
//        }.resume()
//    }
//
//}

