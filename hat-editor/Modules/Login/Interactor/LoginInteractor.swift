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

        let loginRequest = LoginNetworkRequest(username: username, password: password)

        loginRequest.responseSubject.subscribe(onNext: { result in
            switch result {
            case .success(let apiToken):
                Settings.token = apiToken.token
                Settings.username = username
                self.output.didReceiveServerToken(result: true)
            case .error:
                self.output.didReceiveServerToken(result: false)
            }

        }).disposed(by: bag)

        loginRequest.responseSubject.subscribe(onError: { [unowned self] error in
            self.output.didReceiveServerToken(result: false)
        }).disposed(by: bag)

        loginRequest.schedule()
    }
}
