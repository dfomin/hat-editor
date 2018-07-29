//
//  PackItemType.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol PackItemType {
    var id: Int { get }
    var name: String { get }
    var candidates: Int { get }
    var accepted: Int { get }
    var toEdit: Int { get }
    var rejected: Int { get }
}

struct PackItem: PackItemType {
    let id: Int
    let name: String
    let candidates: Int
    let accepted: Int
    let toEdit: Int
    let rejected: Int
}
