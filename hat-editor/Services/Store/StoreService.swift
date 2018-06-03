//
//  StoreService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol StoreService {
    // MARK: Inputs
    var packInput: AnyObserver<PhrasesPack> { get }
    var packsInput: AnyObserver<[PhrasesPack]> { get }

    // MARK: Outputs
    var packsOutput: Observable<[PhrasesPack]> { get }
}
