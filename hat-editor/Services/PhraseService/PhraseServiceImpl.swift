//
//  PhraseServiceImpl.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

class PhraseServiceImpl {
    private let api: ApiService
    private let store: StoreService

    private let phraseSubjectInput = PublishSubject<Phrase>()
    private let errors = PublishSubject<Error>()

    private let bag = DisposeBag()

    init(api: ApiService, store: StoreService) {
        self.api = api
        self.store = store

        let request = phraseSubjectInput
            .flatMap { [unowned self] phrase in
                return self.api.update(phrase: phrase)
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
            .flatMap { result -> Observable<Phrase> in
                if case .success(let value) = result {
                    return .just(value)
                }
                return .empty()
            }
            .bind(to: store.phraseInput)
            .disposed(by: bag)
    }
}

extension PhraseServiceImpl: PhraseService {
    var phraseInput: AnyObserver<Phrase> {
        return phraseSubjectInput.asObserver()
    }

    var phraseOutput: Observable<[PhrasesPack]> {
        return store.packsOutput
    }

    var errorOutput: Observable<Error> {
        return errors.asObservable()
    }
}
