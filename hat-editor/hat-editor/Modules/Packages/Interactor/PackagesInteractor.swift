//
//  Packages PackagesInteractor.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

typealias PackagesInteractorContext = AppContext // & write more precisely

class PackagesInteractor {
    weak var output: PackagesInteractorOutput!
    private let context: PackagesInteractorContext

    init(context: PackagesInteractorContext) {
        self.context = context
    }
}

// MARK: - PackagesInteractorInput

extension PackagesInteractor: PackagesInteractorInput {
}
