//
//  NetworkManager.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 06/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire
import RxAlamofire
import RxSwift

enum NetworkAPIError: Error {
    case pathIsNotURL
    case noToken
}

enum NetworkResponse<T> {
    case success(T)
    case error(Error)
}

class NetworkManager {
    private var requestsQueue = [NetworkRequest]()
    private let serverURLPrefix: String
    private let bag = DisposeBag()

    init(serverURLPrefix: String) {
        self.serverURLPrefix = serverURLPrefix
    }

    func add(request: NetworkRequest) {
        requestsQueue.append(request)

        DispatchQueue.global(qos: .background).async {
            for request in self.requestsQueue {
                do {
                    try self.send(request: request.data).bind(to: request.responseSubject).disposed(by: self.bag)
                } catch let error {
                    print(error)
                }
            }
        }
    }

    private func send(request: NetworkRequestData) throws -> Observable<(HTTPURLResponse, Data)> {
        guard let url = URL(string: serverURLPrefix + request.urlSuffix) else {
            throw NetworkAPIError.pathIsNotURL
        }

        var headers = request.headers ?? [:]

        if request.needAuthorization {
            guard let token = Settings.token else {
                throw NetworkAPIError.noToken
            }

            headers["authorization"] = "bearer " + token
        }

        return RxAlamofire.requestData(request.method, url, parameters: request.parameters, encoding: JSONEncoding.default, headers: headers)
    }
}
