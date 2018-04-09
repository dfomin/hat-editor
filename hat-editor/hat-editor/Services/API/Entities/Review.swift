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
    let phrase: String
    let status: ReviewStatus
}

enum ReviewStatus: Int {
    case rejected = 0, candidate, approved
}
