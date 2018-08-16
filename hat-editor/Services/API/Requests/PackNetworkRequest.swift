//
//  PackNetworkRequest.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 16/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire

class PackNetworkRequest: TypedNetworkRequest<PhrasesPack> {
    init(id: Int) {
        let urlSuffix = "/packs/\(id)"

        let method = HTTPMethod.get

        let data = NetworkRequestData(urlSuffix: urlSuffix, method: method, parameters: nil, headers: nil, needAuthorization: true)

        super.init(data: data)
    }
}
