//
//  Login LoginRouterInput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

// MARK: - Routing for external modules

protocol LoginRouterInput: AnyObject {

}

// MARK: - Routing inside Login

protocol LoginRouterInternalInput: LoginRouterInput {
    func presentPacks()
}
