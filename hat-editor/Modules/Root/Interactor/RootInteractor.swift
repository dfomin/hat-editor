//
//  Root RootInteractor.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

typealias RootInteractorContext = AppContext

class RootInteractor {
    weak var output: RootInteractorOutput!
    private let context: RootInteractorContext

    init(context: RootInteractorContext) {
        self.context = context
    }
}

// MARK: - RootInteractorInput

extension RootInteractor: RootInteractorInput {
}
