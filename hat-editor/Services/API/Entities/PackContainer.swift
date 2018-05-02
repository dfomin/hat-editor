//
//  PackContainer.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 03.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct PackContainer: Codable {
    let pack: PhrasesPack
    let count: Int
}

extension PackContainer {
    enum CodingKeys: String, CodingKey {
        case pack
        case count
    }
}
