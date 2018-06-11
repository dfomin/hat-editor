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

protocol HasPhraseService {
    var phraseService: PhraseService { get }
}

protocol HasLoginService {
    var loginService: LoginService { get }
}

typealias AppContext = HasApiService & HasStoreService & HasPacksService & HasPhraseService & HasLoginService
