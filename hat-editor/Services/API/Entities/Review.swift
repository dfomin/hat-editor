//
//  Review.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct Review {
    let author: String
    let status: ReviewStatus
}

extension Review {
    init?(dictionary: [String: String]) {
        guard let authorValue = dictionary["author"] else { return nil }
        guard let statusValue = dictionary["status"], let reviewStatusValue = ReviewStatus(rawValue: statusValue) else { return nil }

        author = authorValue
        status = reviewStatusValue
    }
}

enum ReviewStatus: String {
    case unknown
    case delete
    case edit
    case accept
}
