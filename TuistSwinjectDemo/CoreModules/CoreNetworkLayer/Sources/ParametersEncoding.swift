//
//  ParametersEncoding.swift
//  NetworkLayerDemo
//
//  Created by Peace on 16.07.2022.
//

import Foundation

public protocol ParameterEncoding {
    func encode(_ service: ServiceProtocol, task: Task) -> URLRequest
}
struct URLEncoding: ParameterEncoding {
    static let `default` = URLEncoding()
    private init() {}

    func encode(_ service: ServiceProtocol, task: Task) -> URLRequest {
        var urlRequest = service.urlRequest
        var urlComponents = URLComponents(url: service.requestURL, resolvingAgainstBaseURL: false)
        switch task {
        case .requestPlain:
            return urlRequest
            
        case .requestParameters(let parameters):
            urlComponents?.queryItems = parameters.map {.init(name: $0, value: "\($1)")}
            urlRequest.url = urlComponents?.url
            return urlRequest
        }
    }
}
struct JSONEncoding: ParameterEncoding {
    static var `default`: JSONEncoding {
        JSONEncoding()
    }
    func encode(_ service: ServiceProtocol, task: Task) -> URLRequest {
        var urlRequest = service.urlRequest

        switch task {
        case .requestPlain:
            return urlRequest
            
        case .requestParameters(let parameters):
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            return urlRequest
        }
    }
}
