//
//  Packages PackagesPresenter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class PackagesPresenter: PackagesModuleInput {
    weak var view: PackagesViewInput!
    var interactor: PackagesInteractorInput!
    var router: PackagesRouterInternalInput!
}

// MARK: - PackagesViewOutput

extension PackagesPresenter: PackagesViewOutput {
    func viewIsReady() {
        view.setupInitialState()
    }
}

// MARK: - PackagesInteractorOutput

extension PackagesPresenter: PackagesInteractorOutput {
}
