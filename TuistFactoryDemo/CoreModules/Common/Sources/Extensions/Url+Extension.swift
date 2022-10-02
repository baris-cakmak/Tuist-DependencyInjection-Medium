//
//  Url+Extension.swift
//  Common
//
//  Created by Peace on 18.09.2022.
//

import Foundation

extension URL {
    public static func string(_ urlString: String) -> URL {
        guard let url = self.init(string: urlString) else {
            fatalError("Url creation error")
        }
        return url
    }
}
