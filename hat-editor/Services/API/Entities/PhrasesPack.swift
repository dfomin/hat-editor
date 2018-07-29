//
//  PhrasesPack.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct PhrasesPack: Codable {
    let id: Int
    let version: Int
    let language: String
    let name: String
    let phrases: [Phrase]?

    var versionedPhrases: [Phrase]? {
        guard let phrases = phrases else { return nil }

        var phrasesDictionary = [Int: Phrase]()

        for phrase in phrases {
            if phrasesDictionary[phrase.trackId] != nil {
                if phrasesDictionary[phrase.trackId]!.version < phrase.version {
                    phrasesDictionary[phrase.trackId]! = phrase
                }
            } else {
                phrasesDictionary[phrase.trackId] = phrase
            }
        }

        return phrasesDictionary.values.sorted(by: { $0.phrase < $1.phrase })
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        version = try values.decode(Int.self, forKey: .version)
        language = try values.decode(String.self, forKey: .language)
        name = try values.decode(String.self, forKey: .name)
        phrases = try? values.decode([Phrase].self, forKey: .phrases)
    }
}

extension PhrasesPack {
    var candidates: Int {
        return count(of: nil)
    }

    var accepted: Int {
        return count(of: .accept)
    }

    var toEdit: Int {
        return count(of: .edit)
    }

    var rejected: Int {
        return count(of: .delete)
    }

    private func count(of reviewStatus: ReviewStatus?) -> Int {
        return phrases?.reduce(0) { $0 + ($1.reviewStatus == reviewStatus ? 1 : 0) } ?? 0
    }
}
