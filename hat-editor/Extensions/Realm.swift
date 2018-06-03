//
//  Realm.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RealmSwift
import RxSwift

extension Realm {
    func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}


extension Realm {
    func exactUpdateObserver<T: Storable>() -> AnyObserver<[T]> {
        return AnyObserver<[T]> { [unowned self] event in
            if case .next(let entities) = event {
                do {
                    try self.safeWrite {
                        let new = entities.map { $0.managedObject }
                        if let primary = T.ManagedObject.primaryKey() {
                            let objectsPrimaryKeys = new.map( { $0.value(forKey: primary) } )
                            let toDelete = self.objects(T.ManagedObject.self)
                                .filter("NOT (\(primary) IN %@)", objectsPrimaryKeys)
                            self.delete(toDelete)
                        } else {
                            self.delete(self.objects(T.ManagedObject.self))
                        }
                        self.add(new, update: true)
                    }
                } catch let error {
                    print(error)
                }
            }
        }
    }

    func exactUpdateObserver<T: Storable>() -> AnyObserver<T> {
        return AnyObserver<T> { [unowned self] event in
            if case .next(let entity) = event {
                do {
                    try self.safeWrite {
                        self.add(entity.managedObject, update: true)
                    }
                } catch let error {
                    print(error)
                }
            }
        }
    }
}
