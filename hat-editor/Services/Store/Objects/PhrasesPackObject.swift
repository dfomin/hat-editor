//
//  PhrasesPackObject.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
import RealmSwift

class PhrasesPackObject: Object {
    @objc dynamic var id: Int = -1
    @objc dynamic var version: Int = 0
    @objc dynamic var language: String = ""
    @objc dynamic var name: String = ""

    let phrases = List<PhraseObject>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension PhrasesPack: Storable {
    typealias ManagedObject = PhrasesPackObject

    init(managedObject: PhrasesPackObject) {
        id = managedObject.id
        version = managedObject.version
        language = managedObject.language
        name = managedObject.name
        phrases = managedObject.phrases.map(Phrase.init(managedObject:))
    }

    var managedObject: PhrasesPackObject {
        let object = PhrasesPackObject()

        object.id = id
        object.version = version
        object.language = language
        object.name = name
        if let phrases = phrases {
            object.phrases.append(objectsIn: (phrases.map{ $0.managedObject }))
        }

        return object
    }
}
