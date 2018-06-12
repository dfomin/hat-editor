//
//  EditPack EditPackPresenter.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class EditPackPresenter: EditPackModuleInput {

    weak var view: EditPackViewInput!

    var interactor: EditPackInteractorInput!
    var router: EditPackRouterInternalInput!

    func set(pack: PhrasesPack) {
        interactor.set(pack: pack)
    }
}

// MARK: - EditPackViewOutput

extension EditPackPresenter: EditPackViewOutput {
    func viewIsReady() {
        view.setPack(title: interactor.packTitle)

        interactor.subscribe()
    }

    func viewDidAskRowsNumber() -> Int {
        return interactor.numberOfPhrases
    }

    func viewDidAskModel(for index: Int) -> Phrase {
        return interactor.phrase(at: index)
    }

    func viewDidChangeModel(review: ReviewStatus, for trackId: Int) {
        interactor.set(review: review, for: trackId)
    }

    func viewDidSelect(at index: Int) {
        let phrase = interactor.phrase(at: index)
        router.present(phrase: phrase)
    }
}

// MARK: - EditPackInteractorOutput

extension EditPackPresenter: EditPackInteractorOutput {
    func didFail(with error: Error) {
        view.showError(error: error)
    }

    func didUpdatePack() {
        view.reload()
    }
}
