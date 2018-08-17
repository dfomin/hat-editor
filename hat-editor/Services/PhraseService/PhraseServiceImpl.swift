//
//  PhraseServiceImpl.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

class PhraseServiceImpl {
    private let store: StoreService

    private let errors = PublishSubject<Error>()

    private let bag = DisposeBag()

    init(store: StoreService) {
        self.store = store
    }
}

extension PhraseServiceImpl: PhraseService {
    func update(phrase: Phrase) {
        let request = UpdatePhraseNetworkRequest(trackId: phrase.trackId, phrase: phrase.phrase, description: phrase.description, version: phrase.version)

        request.responseSubject.subscribe { [weak self] event in
            switch event {
            case .next(NetworkResponse.success(let value)):
                self?.store.phraseInput.onNext(value)
            case .next(NetworkResponse.error(let error)), .error(let error):
                self?.errors.onNext(error)
            case .completed:
                break
            }
        }.disposed(by: bag)

        request.schedule()
    }

    func update(review: Review, for phraseTrackID: Int) {
        let request = UpdateReviewNetworkRequest(review: review, for: phraseTrackID)

        request.responseSubject.subscribe { [weak self] event in
            switch event {
            case .next(NetworkResponse.success(let value)):
                self?.store.phraseInput.onNext(value)
            case .next(NetworkResponse.error(let error)), .error(let error):
                self?.errors.onNext(error)
            case .completed:
                break
            }
        }.disposed(by: bag)

        request.schedule()
    }

    var phraseOutput: Observable<[PhrasesPack]> {
        return store.packsOutput
    }

    var errorOutput: Observable<Error> {
        return errors.asObservable()
    }
}
