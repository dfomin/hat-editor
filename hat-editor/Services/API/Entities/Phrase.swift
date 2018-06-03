//
//  Phrase.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct Phrase: Codable {
    let phrase: String
    let complexity: Double
    let description: String
    var reviews: [Review]
}
