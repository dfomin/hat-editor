//
//  AppContext.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol HasApiService {
    var apiService: ApiService { get }
}

protocol HasStoreService {
    var storeService: StoreService { get }
}

protocol HasPacksService {
    var packsService: PacksService { get }
}

typealias AppContext = HasApiService & HasStoreService & HasPacksService
