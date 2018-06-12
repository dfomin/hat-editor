//
//  EditPhrase EditPhraseInteractorInput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol EditPhraseInteractorInput {
    var phraseText: String { get }
    var phraseDescription: String { get }

    func set(phrase: Phrase)
    func update(newPhrase: String, newDescription: String)
}
