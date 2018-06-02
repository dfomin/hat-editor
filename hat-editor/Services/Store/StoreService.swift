//
//  StoreService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol StoreService {
    var packsInput: AnyObserver<[PhrasesPack]> { get }

    var packsOutput: Observable<[PhrasesPack]> { get }
}
