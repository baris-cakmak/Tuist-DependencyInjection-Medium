//
//  PostModel.swift
//  NetworkLayerDemo
//
//  Created by Peace on 16.07.2022.
//

import Foundation

public struct PostModel: Decodable {
    // MARK: - Properties
    let id: Int
    // MARK: - Init
    public init(id: Int) {
        self.id = id
    }
}
