//
//  LoginNetworkRequest.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 06/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire
import RxSwift

class LoginNetworkRequest: NetworkRequest {
    let loginResponseSubject = PublishSubject<NetworkResponse<ApiToken>>()
    let bag = DisposeBag()

    init(username: String, password: String) {
        let urlSuffix = "/accounts/login"

        let method = HTTPMethod.post

        var parameters = [String: Any]()
        parameters["name"] = username
        parameters["password"] = password

        let data = NetworkRequestData(urlSuffix: urlSuffix, method: method, parameters: parameters, headers: nil, needAuthorization: false)
        
        super.init(data: data)

        initSubject()
    }
}

private extension LoginNetworkRequest {
    func initSubject() {
        responseSubject.flatMap({ arg -> Observable<NetworkResponse<ApiToken>> in
            do {
                let value = try JSONDecoder().decode(ApiToken.self, from: arg.1)
                return Observable.just(NetworkResponse.success(value))
            } catch let error {
                return Observable.just(NetworkResponse.error(error))
            }
        }).bind(to: loginResponseSubject).disposed(by: bag)
    }
}
