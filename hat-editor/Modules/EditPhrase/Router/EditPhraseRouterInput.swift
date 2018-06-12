//
//  EditPhrase EditPhraseRouterInput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

// MARK: - Routing for external modules

protocol EditPhraseRouterInput: AnyObject {
    func set(phrase: Phrase)
}

// MARK: - Routing inside EditPhrase

protocol EditPhraseRouterInternalInput: EditPhraseRouterInput {
    func pop()
}
