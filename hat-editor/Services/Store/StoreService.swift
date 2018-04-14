//
//  StoreService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol StoreService {
    var packagesInput: AnyObserver<[PhrasesPackage]> {get}

    var packagesOutput: Observable<[PhrasesPackage]> {get}
}
