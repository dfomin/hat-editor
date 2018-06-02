//
//  PacksServiceImpl.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift
import RxCocoa

class PacksServiceImpl {
    private let api: ApiService
    private let store: StoreService

    private let refreshPacksSubject = PublishSubject<Void>()
    private let downloadPackSubject = PublishSubject<Void>()
    private let errors = PublishSubject<Error>()

    private let bag = DisposeBag()

    init(api: ApiService, store: StoreService) {
        self.api = api
        self.store = store

        let request = refreshPacksSubject
            .flatMap { [unowned self] _ in
                return self.api.allPacks()
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
            .flatMap { result -> Observable<[PhrasesPack]> in
                if case .success(let value) = result {
                    return .just(value)
                }
                return .empty()
            }
            .bind(to: store.packsInput)
            .disposed(by: bag)
    }
}

extension PacksServiceImpl: PacksService {
    var refreshPacksInput: AnyObserver<Void> {
        return refreshPacksSubject.asObserver()
    }

    var downloadPackInput: AnyObserver<Void> {
        return downloadPackSubject.asObserver()
    }

    var packsOutput: Observable<[PhrasesPack]> {
        return store.packsOutput
    }

    var errorOutput: Observable<Error> {
        return errors.asObservable()
    }

    func downloadPack(with id: Int) {
        let request = downloadPackSubject
            .flatMap { [unowned self] _ in
                return self.api.pack(id: id)
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
            .flatMap { result -> Observable<[PhrasesPack]> in
                if case .success(let value) = result {
                    return .just([value])
                }
                return .empty()
            }
            .bind(to: store.packsInput)
            .disposed(by: bag)
    }
}
