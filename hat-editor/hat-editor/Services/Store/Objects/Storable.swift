//
//  Storable.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RealmSwift

protocol Storable {
    associatedtype ManagedObject: Object
    static var managedObjectType: ManagedObject.Type { get }

    init(managedObject: ManagedObject)
    var managedObject: ManagedObject { get }
}

extension Storable {
    static var managedObjectType: ManagedObject.Type {
        return ManagedObject.self
    }
}
