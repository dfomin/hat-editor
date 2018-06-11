//
//  LoginServiceImpl.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 09/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

class LoginServiceImpl {
    private let api: ApiService

    private let loginSubjectInput = PublishSubject<(String, String)>()
    private let loginSubjectOutput = PublishSubject<ApiToken>()
    private let errors = PublishSubject<Error>()

    private let bag = DisposeBag()

    init(api: ApiService) {
        self.api = api

        let request = loginSubjectInput
            .flatMap { [unowned self] loginInfo in
                return self.api.login(username: loginInfo.0, password: loginInfo.1)
            }
            .share()

        request
            .flatMap { result -> Observable<Error> in
                if case .error(let error) = result {
                    return .just(error)
                }
                return .empty()
            }
            .bind(to: errors)
            .disposed(by: bag)

        request
            .flatMap { result -> Observable<ApiToken> in
                if case .success(let value) = result {
                    return .just(value)
                }
                return .empty()
            }
            .bind(to: loginSubjectOutput)
            .disposed(by: bag)
    }
}

extension LoginServiceImpl: LoginService {
    var loginInput: AnyObserver<(String, String)> {
        return loginSubjectInput.asObserver()
    }

    var loginOutput: Observable<ApiToken> {
        return loginSubjectOutput.asObservable()
    }

    var errorOutput: Observable<Error> {
        return errors.asObservable()
    }
}
