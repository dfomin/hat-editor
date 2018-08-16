//
//  Context.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

class Context: AppContext {
    let storeService: StoreService
    let packsService: PacksService
    let phraseService: PhraseService

    init() {
        storeService = Store()
        packsService = PacksServiceImpl(store: storeService)
        phraseService = PhraseServiceImpl(store: storeService)
    }
}
