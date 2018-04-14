//
//  PackageContainer.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 03.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct PackageContainer: Codable {
    let package: PhrasesPackage
    let count: Int
}

extension PackageContainer {
    enum CodingKeys: String, CodingKey {
        case package = "pack"
        case count
    }
}
