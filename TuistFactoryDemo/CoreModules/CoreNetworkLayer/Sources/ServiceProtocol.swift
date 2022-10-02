//
//  ServiceProtocol.swift
//  NetworkLayerDemo
//
//  Created by Peace on 16.07.2022.
//

import Foundation

public typealias Headers = [String: Any]

public protocol ServiceProtocol {
    var baseURL: URL { get }
    var requestURL: URL { get }
    var path: String { get }
//    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var parametersEncoding: ParameterEncoding { get }
    var urlRequest: URLRequest { get }
    var headers: Headers? { get }
    var task: Task { get }
}

extension ServiceProtocol {
    public var requestURL: URL {
        baseURL.appendingPathComponent(path, isDirectory: false)
    }
    public var parametersEncoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        
        case .post, .delete, .put:
            return JSONEncoding.default
        }
    }
    public var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers?.forEach {
            request.addValue($0, forHTTPHeaderField: "\($1)")
        }
        return request
    }
    public var headers: Headers? {
        nil
    }
    public func asURLRequest() -> URLRequest {
        parametersEncoding.encode(self, task: task)
    }
}
