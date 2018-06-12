//
//  EditPhrase EditPhraseInteractor.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

typealias EditPhraseInteractorContext = AppContext // & write more precisely

class EditPhraseInteractor {
    weak var output: EditPhraseInteractorOutput!
    private let context: EditPhraseInteractorContext

    private var phrase: Phrase!

    private let bag = DisposeBag()

    init(context: EditPhraseInteractorContext) {
        self.context = context
    }
}

// MARK: - EditPhraseInteractorInput

extension EditPhraseInteractor: EditPhraseInteractorInput {
    func set(phrase: Phrase) {
        self.phrase = phrase
    }

    func update(newPhrase: String, newDescription: String) {
        let newPhrase = Phrase(trackId: phrase.trackId, phrase: newPhrase, complexity: phrase.complexity, description: newDescription, reviews: phrase.reviews)

        context.phraseService.phraseInput.onNext(newPhrase)
    }

    var phraseText: String {
        return phrase.phrase
    }

    var phraseDescription: String {
        return phrase.description
    }
}
