//
//  NetworkRequest.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 06/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire
import RxSwift

struct NetworkRequestData {
    let urlSuffix: String
    let method: HTTPMethod
    let parameters: [String: Any]?
    let headers: [String: String]?
    let needAuthorization: Bool
}

class NetworkRequest {
    static var manager = NetworkManager(serverURLPrefix: Settings.serverURLPrefix)

    let data: NetworkRequestData
    let responseSubject = PublishSubject<(HTTPURLResponse, Data)>()

    init(data: NetworkRequestData) {
        self.data = data
    }

    func schedule() {
        NetworkRequest.manager.add(request: self)
    }
}
