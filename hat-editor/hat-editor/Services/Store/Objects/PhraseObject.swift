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
    @objc dynamic var phrase: String = ""
    @objc dynamic var complexity: Double = 0.0
    @objc dynamic var descript: String = ""

    let reviews = List<ReviewObject>()

    let linkingPackages = LinkingObjects(fromType: PhrasesPackageObject.self, property: "phrases")

    override static func primaryKey() -> String? {
        return "phrase"
    }
}

extension Phrase: Storable {
    typealias ManagedObject = PhraseObject

    init(managedObject: PhraseObject) {
        phrase = managedObject.phrase
        complexity = managedObject.complexity
        description = managedObject.descript
        reviews = managedObject.reviews.map(Review.init(managedObject:))
    }

    var managedObject: PhraseObject {
        let object = PhraseObject()

        object.phrase = phrase
        object.complexity = complexity
        object.descript = description
        object.reviews.append(objectsIn: reviews.map { $0.managedObject } )

        return object
    }
}
