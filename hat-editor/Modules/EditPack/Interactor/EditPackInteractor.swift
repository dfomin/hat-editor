//
//  EditPack EditPackInteractor.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

typealias EditPackInteractorContext = AppContext // & write more precisely

class EditPackInteractor {
    weak var output: EditPackInteractorOutput!

    private let context: EditPackInteractorContext
    private let bag = DisposeBag()

    private var pack: PhrasesPack!

    init(context: EditPackInteractorContext) {
        self.context = context
    }
}

// MARK: - EditPackInteractorInput

extension EditPackInteractor: EditPackInteractorInput {
    var packTitle: String {
        return pack.name
    }

    var numberOfPhrases: Int {
        return pack.versionedPhrases?.count ?? 0
    }

    func phrase(at index: Int) -> Phrase {
        return pack.versionedPhrases![index]
    }

    func set(pack: PhrasesPack) {
        self.pack = pack
        context.packsService.downloadPackInput.onNext(pack.id)
    }

    func subscribe() {
        context.packsService.packsOutput.subscribe(onNext: { [unowned self] result in
            if let updatedPack = result.filter({ $0.id == self.pack.id }).first {
                self.pack = updatedPack
                self.output.didUpdatePack()
            }
        }).disposed(by: bag)

        context.packsService.errorOutput.subscribe(onNext: { [unowned self] error in
            self.output.didFail(with: error)
        }).disposed(by: bag)
    }

    func set(review: ReviewStatus, for trackId: Int) {
        let review = Review(author: Settings.username!, status: review, comment: "")
        context.phraseService.phraseReviewInput.onNext((review, trackId))
    }
}
