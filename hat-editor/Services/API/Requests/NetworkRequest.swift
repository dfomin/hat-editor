//
//  NetworkRequest.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 06/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire
import RxSwift
import RxCocoa

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
    let rawResponseSubject = PublishSubject<(HTTPURLResponse, Data)>()

    init(data: NetworkRequestData) {
        self.data = data
    }

    func schedule() {
        NetworkRequest.manager.add(request: self)
    }
}

class TypedNetworkRequest<T: Codable>: NetworkRequest {
    private let bag = DisposeBag()

    let responseSubject = PublishSubject<NetworkResponse<T>>()

    override init(data: NetworkRequestData) {
        super.init(data: data)

        rawResponseSubject.flatMap({ arg -> Observable<NetworkResponse<T>> in
            do {
                print(String(data: arg.1, encoding: String.Encoding.utf8) ?? "")
                let value = try JSONDecoder().decode(T.self, from: arg.1)
                return Observable.just(NetworkResponse.success(value))
            } catch let error {
                return Observable.just(NetworkResponse.error(error))
            }
        }).bind(to: responseSubject).disposed(by: bag)
    }
}
