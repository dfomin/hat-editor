//
//  UpdatePhraseNetworkRequest.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 16/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire

class UpdatePhraseNetworkRequest: TypedNetworkRequest<Phrase> {
    init(trackId: Int, phrase: String?, description: String?, version: Int) {
        let urlSuffix = "/phrases/\(trackId)"

        let method = HTTPMethod.put

        var parameters = [String: Any]()
        parameters["phrase"] = phrase
        parameters["description"] = description
        parameters["version"] = version
        parameters["author"] = Settings.username!
        parameters["clearReview"] = true

        let data = NetworkRequestData(urlSuffix: urlSuffix, method: method, parameters: parameters, headers: nil, needAuthorization: true)

        super.init(data: data)
    }
}
