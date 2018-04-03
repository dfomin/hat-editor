//
//  PackagesServiceImpl.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift
import RxCocoa

class PackagesServiceImpl {
    private let api: ApiService
    private let store: StoreService

    private let refreshPackagesSubject = PublishSubject<Void>()
    /// temporary: remove when store will be introduced
    private let packagesSubject = BehaviorRelay<PigowlAPIResult<PackagesList>>(value:
        .success(PackagesList(packages: [], result: true)))

    private let bag = DisposeBag()

    init(api: ApiService, store: StoreService) {
        self.api = api
        self.store = store

        refreshPackagesSubject
            .flatMap({ [unowned self] _ in
                return self.api.allPackages()
            })
            .do(onNext: { result in
                print(result)
            })
            .bind(to: packagesSubject) // TODO: bind to store
            .disposed(by: bag)
    }
}

extension PackagesServiceImpl: PackagesService {
    var refreshPackagesInput: AnyObserver<Void> {
        return refreshPackagesSubject.asObserver()
    }

    var packagesOutput: Observable<PigowlAPIResult<PackagesList>> {
        return packagesSubject.asObservable()
    }
}
