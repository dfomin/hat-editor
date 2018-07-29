//
//  Phrase.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct Phrase: Codable {
    let trackId: Int
    let phrase: String
    let complexity: Double
    let description: String
    let version: Int
    let reviews: [Review]

    var reviewStatus: ReviewStatus? {
        var result: ReviewStatus? = nil
        for review in reviews {
            if review.status == .delete {
                result = .delete
                break
            } else if review.status == .edit {
                result = .edit
            }
        }

        if result != nil {
            return result
        } else {
            return reviews.count == 4 ? .accept : nil
        }
    }
}
