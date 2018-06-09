//
//  Context.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

class Context: AppContext {
    let apiService: ApiService
    let storeService: StoreService
    let packsService: PacksService
    let loginService: LoginService

    init() {
        apiService = PigowlAPI()
        storeService = Store()
        packsService = PacksServiceImpl(api: apiService, store: storeService)
        loginService = LoginServiceImpl(api: apiService)
    }
}
