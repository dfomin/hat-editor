//
//  Phrase.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct Phrase {
    let phrase: String
    let complexity: Double
    let description: String
    var reviews: [Review]
}

extension Phrase {
    enum CodingKeys: String, CodingKey {
        case phrase
        case complexity
        case description
        case reviews
    }
}

extension Phrase: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        phrase = try values.decode(String.self, forKey: .phrase)
        complexity = try values.decode(Double.self, forKey: .complexity)
        description = try values.decode(String.self, forKey: .description)

        var reviewsArray = try values.nestedUnkeyedContainer(forKey: .reviews)
        var result = [Review]()
        while !reviewsArray.isAtEnd {
            let review = try reviewsArray.decode([String: String].self)
            if let statusReview = Review(dictionary: review) {
                result.append(statusReview)
            }
        }
        reviews = result
    }
}

extension Phrase: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(phrase, forKey: .phrase)
        try container.encode(complexity, forKey: .complexity)
        try container.encode(description, forKey: .description)

        var reviewsDictionary: [String: String] = [:]
        for review in reviews {
            reviewsDictionary[review.author] = review.status.rawValue
        }
        try container.encode(reviewsDictionary, forKey: .reviews)
    }
}
