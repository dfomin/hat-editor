//
//  LoginNetworkRequest.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 06/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire
import RxSwift

class LoginNetworkRequest: TypedNetworkRequest<ApiToken> {
    init(username: String, password: String) {
        let urlSuffix = "/accounts/login"

        let method = HTTPMethod.post

        var parameters = [String: Any]()
        parameters["name"] = username
        parameters["password"] = password

        let data = NetworkRequestData(urlSuffix: urlSuffix, method: method, parameters: parameters, headers: nil, needAuthorization: false)
        
        super.init(data: data)
    }
}
