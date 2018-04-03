//
//  PackagesService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol PackagesService {
    var refreshPackagesInput: AnyObserver<Void> { get }

    var packagesOutput: Observable<PigowlAPIResult<PackagesList>> { get }
}
