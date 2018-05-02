//
//  PacksRouterInput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

// MARK: - Routing for external modules

protocol PacksRouterInput: AnyObject {

}

// MARK: - Routing inside Packs

protocol PacksRouterInternalInput: PacksRouterInput {
    func showPackScene(for package: PhrasesPack)
}
