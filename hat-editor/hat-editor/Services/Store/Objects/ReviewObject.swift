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
    @objc dynamic var id: String = ""
    @objc dynamic var phrase: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var status: Int = 0

    let linkingPhrases = LinkingObjects(fromType: PhraseObject.self, property: "reviews")

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension Review: Storable {
    typealias ManagedObject = ReviewObject

    init(managedObject: ReviewObject) {
        phrase = managedObject.phrase
        author = managedObject.author
        status = ReviewStatus(rawValue: managedObject.status)!
    }

    var managedObject: ReviewObject {
        let object = ReviewObject()

        object.id = author.appending(phrase)
        object.phrase = phrase
        object.author = author
        object.status = status.rawValue

        return object
    }
}
