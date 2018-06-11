//
//  Login LoginInteractor.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

typealias LoginInteractorContext = AppContext // & write more precisely

class LoginInteractor {
    weak var output: LoginInteractorOutput!
    private let context: LoginInteractorContext

    private let bag = DisposeBag()

    init(context: LoginInteractorContext) {
        self.context = context
    }
}

// MARK: - LoginInteractorInput

extension LoginInteractor: LoginInteractorInput {
    func login(username: String, password: String) {
        guard Settings.token == nil else {
            // TODO: log error, internal inconsistency
            return
        }

        context.loginService.loginInput.onNext((username, password))

        context.loginService.loginOutput.subscribe(onNext: { result in
            Settings.token = result.token
            Settings.username = username
            self.output.didReceiveServerToken(result: true)
        }).disposed(by: bag)

        context.loginService.errorOutput.subscribe(onNext: { [unowned self] error in
            self.output.didReceiveServerToken(result: false)
        }).disposed(by: bag)
    }
}
