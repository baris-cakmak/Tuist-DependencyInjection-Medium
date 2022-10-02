//
//  HTTPTask.swift
//  NetworkLayerDemo
//
//  Created by Peace on 16.07.2022.
//

import Foundation

public typealias Parameters = [String: Any]

public enum Task {
    case requestPlain
    case requestParameters(Parameters)
}
