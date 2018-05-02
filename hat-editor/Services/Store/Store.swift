//
//  Store.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RealmSwift
import RxSwift
import RxRealm

class Store {
    private let realm: Realm
    private let migration: RealmMigrationHandler

    init(migration: RealmMigrationHandler) {
        self.migration = migration
        self.realm = migration.realm
    }

    convenience init() {
        self.init(migration: RealmMigrationHandler())
    }
}

// MARK: - StoreService

extension Store: StoreService {
    var packsInput: AnyObserver<[PhrasesPack]> {
        return realm.exactUpdateObserver()
    }

    var packsOutput: Observable<[PhrasesPack]> {
        let packsObjects = realm.objects(PhrasesPackObject.self).sorted(byKeyPath: "id", ascending: true)
        let packs = Observable.collection(from: packsObjects)
        let phrases = Observable.collection(from: realm.objects(PhraseObject.self))
        let reviews = Observable.collection(from: realm.objects(ReviewObject.self))

        return Observable
            .combineLatest(packs, phrases, reviews)
            .map { tuple in
                return tuple.0.map(PhrasesPack.init(managedObject:))
            }
            .share()
    }
}
