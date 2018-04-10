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
    var packagesInput: AnyObserver<[PhrasesPackage]> {
        return realm.exactUpdateObserver()
    }

    var packagesOutput: Observable<[PhrasesPackage]> {
        let packagesObjects = realm.objects(PhrasesPackageObject.self).sorted(byKeyPath: "id", ascending: true)
        let packages = Observable.collection(from: packagesObjects)
        let phrases = Observable.collection(from: realm.objects(PhraseObject.self))
        let reviews = Observable.collection(from: realm.objects(ReviewObject.self))

        return Observable
            .combineLatest(packages, phrases, reviews)
            .map { tuple in
                return tuple.0.map(PhrasesPackage.init(managedObject:))
            }
            .share()
    }
}
