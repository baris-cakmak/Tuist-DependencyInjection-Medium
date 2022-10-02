//
//  UpperCaseble.swift
//  ProjectDescriptionHelpers
//
//  Created by Peace on 24.09.2022.
//

protocol UpperCaseble {
    var description: String { get }
}

extension UpperCaseble where Self: RawRepresentable, RawValue == String {
    var description: String {
        rawValue.prefix(1).capitalized + rawValue.dropFirst()
    }
}
