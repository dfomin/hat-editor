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

    private let reviewSubjectInput = PublishSubject<(ReviewStatus, Int)>()
    private let reviewSubjectOutput = PublishSubject<Bool>()
    private let errors = PublishSubject<Error>()

    private let bag = DisposeBag()

    init(api: ApiService) {
        self.api = api

        let request = reviewSubjectInput
            .flatMap { [unowned self] reviewInfo in
                return self.api.set(review: reviewInfo.0, for: reviewInfo.1)
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
            .flatMap { result -> Observable<Bool> in
                if case .success(let value) = result {
                    return .just(value)
                }
                return .empty()
            }
            .bind(to: reviewSubjectOutput)
            .disposed(by: bag)
    }
}

extension PhraseServiceImpl: PhraseService {
    var setReviewInput: AnyObserver<(ReviewStatus, Int)> {
        return reviewSubjectInput.asObserver()
    }

    var phraseOutput: Observable<Bool> {
        return reviewSubjectOutput.asObservable()
    }

    var errorOutput: Observable<Error> {
        return errors.asObservable()
    }
}
