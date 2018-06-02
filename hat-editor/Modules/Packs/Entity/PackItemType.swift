//
//  PackItemType.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol PackItemType {
    var number: Int { get }
    var name: String { get }
}

struct PackItem: PackItemType {
    let number: Int
    let name: String
}
