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
    let packagesService: PackagesService

    init() {
        apiService = PigowlAPI()
        storeService = Store()
        packagesService = PackagesServiceImpl(api: apiService, store: storeService)
    }
}
