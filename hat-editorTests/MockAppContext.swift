//
//  MockAppContext.swift
//  hat-editorTests
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
@testable import hat_editor

class MockAppContext: AppContext {
    let apiService: ApiService
    let packsService: PacksService
    let storeService: StoreService
    let loginService: LoginService
    let phraseService: PhraseService

    init() {
        apiService = PigowlAPI()
        storeService = Store()
        packsService = PacksServiceImpl(api: apiService, store: storeService)
        loginService = LoginServiceImpl(api: apiService)
        phraseService = PhraseServiceImpl(api: apiService, store: storeService)
    }
}
