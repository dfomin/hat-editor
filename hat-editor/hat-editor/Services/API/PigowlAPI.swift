//
//  PigowlAPI.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxAlamofire
import RxSwift

enum PigowlAPIResult<T> {
    case success(T)
    case error(Error)
}

enum PigowlAPIError: Error {
    case pathIsNotURL
}

class PigowlAPI: ApiService {
    func allPackages() -> Observable<PigowlAPIResult<PackagesList>> {
        let suffix = Settings.readPortComponent + Settings.devPortSuffix + "/getPacks"
        return makeGetRequest(suffix: suffix)
    }
}

private extension PigowlAPI {
    func makeGetRequest<T: Codable>(suffix: String) -> Observable<PigowlAPIResult<T>> {
        guard let url = URL(string: Settings.serverURLPrefix + suffix) else {
            return Observable.just(PigowlAPIResult.error(PigowlAPIError.pathIsNotURL))
        }
        return RxAlamofire
            .requestData(.get, url)
            .flatMap({ arg -> Observable<PigowlAPIResult<T>> in
                do {
                    let value = try JSONDecoder().decode(T.self, from: arg.1)
                    return Observable.just(PigowlAPIResult.success(value))
                } catch {
                    return Observable.just(PigowlAPIResult.error(error))
                }
            }).catchError({ Observable.just(PigowlAPIResult.error($0)) })
    }
}
