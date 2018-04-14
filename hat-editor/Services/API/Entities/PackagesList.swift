//
//  PackagesList.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct PackagesList: Codable {
    let packages: [PackageContainer]
    let result: Bool
}

extension PackagesList {
    enum CodingKeys: String, CodingKey {
        case packages = "packs"
        case result
    }
}
