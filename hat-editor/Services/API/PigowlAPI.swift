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
    func login(username: String, password: String) -> Observable<PigowlAPIResult<ApiToken>> {
        let suffix = "/accounts/login"
        let params = ["name": username, "password": password]
        return makeRequest(suffix: suffix, method: .post, params: params, needAuthorization: false)
    }

    func allPacks() -> Observable<PigowlAPIResult<[PhrasesPack]>> {
        let suffix = "/packs"
        return makeRequest(suffix: suffix, method: .get)
    }

    func pack(id: Int) -> Observable<PigowlAPIResult<PhrasesPack>> {
        let suffix = "/packs/\(id)"
        return makeRequest(suffix: suffix, method: .get)
    }

    func set(review: ReviewStatus, for trackId: Int) -> Observable<PigowlAPIResult<Bool>> {
        let suffix = ""
        return makeRequest(suffix: suffix, method: .post)
    }

    func update(phrase: Phrase) -> Observable<PigowlAPIResult<Phrase>> {
        let suffix = "/phrases/\(phrase.trackId)"
        let data = try! JSONEncoder().encode(phrase)
        var params = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        params["author"] = Settings.username!
        return makeRequest(suffix: suffix, method: .put, params: params)
    }
}

private extension PigowlAPI {
    func makeRequest<T: Codable>(suffix: String, method: HTTPMethod, params: [String: Any]? = nil, needAuthorization: Bool = true) -> Observable<PigowlAPIResult<T>> {
        guard let url = URL(string: Settings.serverURLPrefix + suffix) else {
            return Observable.just(PigowlAPIResult.error(PigowlAPIError.pathIsNotURL))
        }

        var headers = [String: String]()

        if needAuthorization {
            guard let token = Settings.token else {
                return Observable.just(PigowlAPIResult.error(PigowlAPIError.noToken))
            }

            headers = ["authorization": "bearer " + token]
        }

        return RxAlamofire
            .requestData(method, url, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .flatMap({ arg -> Observable<PigowlAPIResult<T>> in
                do {
                    print(String(data: arg.1, encoding: String.Encoding.utf8)!)
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
