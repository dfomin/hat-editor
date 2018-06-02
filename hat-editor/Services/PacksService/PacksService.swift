//
//  PacksService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol PacksService {
    var refreshPacksInput: AnyObserver<Void> { get }
    var downloadPackInput: AnyObserver<Void> { get }

    var packsOutput: Observable<[PhrasesPack]> { get }

    var errorOutput: Observable<Error> { get }

    func downloadPack(with id: Int)
}
