//
//  EditPack EditPackRouterInput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

// MARK: - Routing for external modules

protocol EditPackRouterInput: AnyObject {
    func set(packID: Int)
}

// MARK: - Routing inside EditPack

protocol EditPackRouterInternalInput: EditPackRouterInput {
    func present(phrase: Phrase)
}
