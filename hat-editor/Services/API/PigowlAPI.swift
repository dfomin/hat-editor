//
//  PigowlAPI.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxAlamofire
import Alamofire
import RxSwift

enum PigowlAPIResult<T> {
    case success(T)
    case error(Error)
}

enum PigowlAPIError: Error {
    case pathIsNotURL
    case noToken
}

class PigowlAPI: ApiService {
    func login() -> Observable<PigowlAPIResult<ApiToken>> {
        let suffix = "/accounts/login"
        let params = ["name": Settings.username, "password": Settings.password]
        return makePostRequest(suffix: suffix, params: params)
    }

    func allPacks() -> Observable<PigowlAPIResult<[PhrasesPack]>> {
        let suffix = "/packs"
        return makeGetRequest(suffix: suffix)
    }

    func pack(id: Int) -> Observable<PigowlAPIResult<PhrasesPack>> {
        let suffix = "/packs/\(id)"
        return makeGetRequest(suffix: suffix)
    }
}

private extension PigowlAPI {
    func makeGetRequest<T: Codable>(suffix: String) -> Observable<PigowlAPIResult<T>> {
        guard let url = URL(string: Settings.serverURLPrefix + suffix) else {
            return Observable.just(PigowlAPIResult.error(PigowlAPIError.pathIsNotURL))
        }

        guard let token = Settings.token else {
            return Observable.just(PigowlAPIResult.error(PigowlAPIError.noToken))
        }

        let headers = ["authorization": "bearer " + token]

        return RxAlamofire
            .requestData(.get, url, headers: headers)
            .flatMap({ arg -> Observable<PigowlAPIResult<T>> in
                do {
                    let value = try JSONDecoder().decode(T.self, from: arg.1)
                    return Observable.just(PigowlAPIResult.success(value))
                } catch {
                    if let body = String(data: arg.1, encoding: .utf8) {
                        let type = String(describing: T.self)
                        print("-------------------------------------------------------------------------")
                        print("An error occured during the \(type) type parsing from the following data:")
                        print(body)
                        print("-------------------------------------------------------------------------")
                    }
                    return Observable.just(PigowlAPIResult.error(error))
                }
            }).catchError({ Observable.just(PigowlAPIResult.error($0)) })
    }

    func makePostRequest<T: Codable>(suffix: String, params: [String: String]? = nil) -> Observable<PigowlAPIResult<T>> {
        guard let url = URL(string: Settings.serverURLPrefix + suffix) else {
            return Observable.just(PigowlAPIResult.error(PigowlAPIError.pathIsNotURL))
        }
        return RxAlamofire
            .requestData(.post, url, parameters: params, encoding: JSONEncoding.default)
            .flatMap({ arg -> Observable<PigowlAPIResult<T>> in
                do {
                    let value = try JSONDecoder().decode(T.self, from: arg.1)
                    return Observable.just(PigowlAPIResult.success(value))
                } catch {
                    if let body = String(data: arg.1, encoding: .utf8) {
                        let type = String(describing: T.self)
                        print("-------------------------------------------------------------------------")
                        print("An error occured during the \(type) type parsing from the following data:")
                        print(body)
                        print("-------------------------------------------------------------------------")
                    }
                    return Observable.just(PigowlAPIResult.error(error))
                }
            }).catchError({ Observable.just(PigowlAPIResult.error($0)) })
    }
}
