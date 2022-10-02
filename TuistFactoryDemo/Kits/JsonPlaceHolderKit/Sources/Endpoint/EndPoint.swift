//
//  EndPoint.swift
//  NetworkLayerDemo
//
//  Created by Peace on 16.07.2022.
//

import Foundation
import Common
import CoreNetworkLayer

enum MovieApi: ServiceProtocol {    
    case getPosts
    case comments(postId: Int)
    case post(title: String, body: String, userId: Int)
}
extension MovieApi {
    var baseURL: URL {
        .string("https://jsonplaceholder.typicode.com")
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
