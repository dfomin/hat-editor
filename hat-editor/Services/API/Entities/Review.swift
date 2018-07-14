//
//  Review.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

struct Review: Codable {
    let author: String
    let status: ReviewStatus
    let comment: String?
}

enum ReviewStatus: String, Codable {
    case unknown
    case delete
    case edit
    case accept
}
