//
//  EditPhrase EditPhraseViewOutput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol EditPhraseViewOutput {
    func viewIsReady()
    func update(phrase: String, description: String)
}
