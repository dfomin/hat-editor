//
//  EditPhrase EditPhraseViewInput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol EditPhraseViewInput: AnyObject {
    func setupInitialState(title: String, description: String)
}
