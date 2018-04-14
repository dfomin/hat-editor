//
//  RealmMigrationHandler.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 09.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RealmSwift

class RealmMigrationHandler {
    let realm: Realm

    init() {
        let currentSchemaVersion: UInt64 = 1

        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: currentSchemaVersion,

            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < currentSchemaVersion { RealmMigrator.empty(migration: migration) }
        })

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config

        do {
            realm = try Realm()
            print("Realm path: \(config.fileURL?.absoluteString ?? "unknown")")
        } catch {
            print(error.localizedDescription)
            fatalError(error.localizedDescription)
        }
    }
}

private struct RealmMigrator {
    typealias MigrationObjectEnumerateBlock = (MigrationObject?, MigrationObject?) -> Void

    static func empty(migration: Migration) {}
}
