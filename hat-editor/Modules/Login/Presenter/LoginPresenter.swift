//
//  Login LoginPresenter.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class LoginPresenter: LoginModuleInput {
    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInternalInput!
}

// MARK: - LoginViewOutput

extension LoginPresenter: LoginViewOutput {
    func viewIsReady() {
        view.setupInitialState()
    }

    func login(username: String, password: String) {
        interactor.login(username: username, password: password)
    }
}

// MARK: - LoginInteractorOutput

extension LoginPresenter: LoginInteractorOutput {
    func didReceiveServerToken(result: Bool) {
        if result {
            router.presentPacks()
        } else {
            view.showTokenError()
        }
    }
}
