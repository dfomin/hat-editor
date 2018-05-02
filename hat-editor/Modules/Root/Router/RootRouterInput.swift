//
//  Root RootRouterInput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

// MARK: - Routing for external modules

protocol RootRouterInput: AnyObject {

}

// MARK: - Routing inside Root

protocol RootRouterInternalInput: RootRouterInput {
    func presentPacks()
    func presentLogin() // for future
}
