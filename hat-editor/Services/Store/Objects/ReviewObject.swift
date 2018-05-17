//
//  ReviewObject.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 10.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
import RealmSwift

class ReviewObject: Object {
    @objc dynamic var author: String = ""
    @objc dynamic var status: Int = 0
}

extension Review: Storable {
    typealias ManagedObject = ReviewObject

    init(managedObject: ReviewObject) {
        author = managedObject.author
        status = ReviewStatus(rawValue: managedObject.status)!
    }

    var managedObject: ReviewObject {
        let object = ReviewObject()

        object.author = author
        object.status = status.rawValue

        return object
    }
}
