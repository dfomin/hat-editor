//
//  PhraseObject.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
import RealmSwift

class PhraseObject: Object {
    @objc dynamic var trackId: Int = 0
    @objc dynamic var phrase: String = ""
    @objc dynamic var descript: String = ""
    @objc dynamic var version: Int = 0

    let reviews = List<ReviewObject>()

    let linkingPacks = LinkingObjects(fromType: PhrasesPackObject.self, property: "phrases")

    override static func primaryKey() -> String? {
        // TODO: wrong, should be 'id'
        return "phrase"
    }
}

extension Phrase: Storable {
    typealias ManagedObject = PhraseObject

    init(managedObject: PhraseObject) {
        trackId = managedObject.trackId
        phrase = managedObject.phrase
        description = managedObject.descript
        version = managedObject.version
        reviews = managedObject.reviews.map(Review.init(managedObject:))
    }

    var managedObject: PhraseObject {
        let object = PhraseObject()

        object.trackId = trackId
        object.phrase = phrase
        object.descript = description
        object.version = version
        object.reviews.append(objectsIn: reviews.map { $0.managedObject } )

        return object
    }
}
