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
    private let errors = PublishSubject<Error>()

    private let bag = DisposeBag()

    init(api: ApiService, store: StoreService) {
        self.api = api
        self.store = store

        let request = refreshPackagesSubject
            .flatMap { [unowned self] _ in
                return self.api.allPackages()
            }
            .share()

        request
            .flatMap { result -> Observable<Error> in
                if case .error(let error) = result {
                    return .just(error)
                }
                return .empty()
            }
            .bind(to: errors)
            .disposed(by: bag)

        request
            .flatMap { result -> Observable<[PhrasesPackage]> in
                if case .success(let value) = result {
                    return .just(value.packages.map { $0.package } )
                }
                return .empty()
            }
            .bind(to: store.packagesInput)
            .disposed(by: bag)
    }
}

extension PackagesServiceImpl: PackagesService {
    var refreshPackagesInput: AnyObserver<Void> {
        return refreshPackagesSubject.asObserver()
    }

    var packagesErrorsOutput: Observable<Error> {
        return errors.asObservable()
    }

    var packagesOutput: Observable<[PhrasesPackage]> {
        return store.packagesOutput
    }
}
