//
//  EditPack EditPackInteractorInput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol EditPackInteractorInput {
    var packTitle: String { get }

    var numberOfPhrases: Int { get }

    func phrase(at index: Int) -> Phrase

    func set(pack: PhrasesPack)
    func subscribe()
}
