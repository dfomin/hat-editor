//
//  Packages PackagesRouterInput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

// MARK: - Routing for external modules

protocol PackagesRouterInput: AnyObject {

}

// MARK: - Routing inside Packages

protocol PackagesRouterInternalInput: PackagesRouterInput {
    func showPackageScene(for package: PhrasesPackage)
}
