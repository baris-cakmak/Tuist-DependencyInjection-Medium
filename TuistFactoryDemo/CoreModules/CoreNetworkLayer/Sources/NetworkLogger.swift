//
//  NetworkLogger.swift
//  NetworkLayerDemo
//
//  Created by Peace on 16.07.2022.
//

import Foundation

public final class NetworkLogger {
    public static func log(request: URLRequest) {
        print("\n - - - - - - - - - - OUTGOING - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = URLComponents(string: urlAsString)
        
        let method = request.httpMethod
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        
        var logOutput =
            """
            \(urlAsString) \n\n
            \(method ?? "") \(path)?\(query) HTTP/1.1 \n
            HOST: \(host)\n
            """
        request.allHTTPHeaderFields?.forEach {
            logOutput += "\($0.key): \($0.value)"
        }
        if let body = request.httpBody {
            logOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        
        print(logOutput)
    }
}
