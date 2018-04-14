//
//  PhrasesPackage.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct PhrasesPackage: Codable {
    let id: Int
    let version: Int
    let language: String
    let name: String
    let phrases: [Phrase]

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        version = try values.decode(Int.self, forKey: .version)
        language = try values.decode(String.self, forKey: .language)
        name = try values.decode(String.self, forKey: .name)
        phrases = (try? values.decode([Phrase].self, forKey: .phrases)) ?? []
    }
}
