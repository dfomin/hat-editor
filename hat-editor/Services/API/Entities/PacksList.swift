//
//  PacksList.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct PacksList: Codable {
    let packs: [PackContainer]
    let result: Bool
}

extension PacksList {
    enum CodingKeys: String, CodingKey {
        case packs
        case result
    }
}
