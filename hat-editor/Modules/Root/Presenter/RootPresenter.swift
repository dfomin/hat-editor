//
//  Root RootPresenter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class RootPresenter: RootModuleInput {
    weak var view: RootViewInput!
    var interactor: RootInteractorInput!
    var router: RootRouterInternalInput!
}

// MARK: - RootViewOutput

extension RootPresenter: RootViewOutput {
    func viewIsReady() {
        view.setupInitialState()
    }

    func viewDidAppear() {
        interactor.requestServerToken()
    }
}

// MARK: - RootInteractorOutput

extension RootPresenter: RootInteractorOutput {
    func didReceiveServerToken(result: Bool) {
        if result {
            router.presentPacks()
        } else {
            view.showNoTokenError()
        }
    }
}
