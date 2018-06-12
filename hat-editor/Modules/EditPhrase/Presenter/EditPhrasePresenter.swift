//
//  EditPhrase EditPhrasePresenter.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class EditPhrasePresenter: EditPhraseModuleInput {
    weak var view: EditPhraseViewInput!
    var interactor: EditPhraseInteractorInput!
    var router: EditPhraseRouterInternalInput!

    func set(phrase: Phrase) {
        interactor.set(phrase: phrase)
    }
}

// MARK: - EditPhraseViewOutput

extension EditPhrasePresenter: EditPhraseViewOutput {
    func viewIsReady() {
        view.setupInitialState(title: interactor.phraseText, description: interactor.phraseDescription)
    }

    func update(phrase: String, description: String) {
        interactor.update(newPhrase: phrase, newDescription: description)

        router.pop()
    }
}

// MARK: - EditPhraseInteractorOutput

extension EditPhrasePresenter: EditPhraseInteractorOutput {
}
