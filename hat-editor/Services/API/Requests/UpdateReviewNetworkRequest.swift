//
//  UpdateReviewNetworkRequest.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 16/08/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Alamofire

class UpdateReviewNetworkRequest: TypedNetworkRequest<Phrase> {
    init(review: Review, for trackId: Int) {
        let urlSuffix = "/phrases/\(trackId)/review"

        let method = HTTPMethod.post

        let reviewData = try! JSONEncoder().encode(review)
        var parameters = try! JSONSerialization.jsonObject(with: reviewData, options: []) as! [String: Any]
        parameters["clearReview"] = true

        let data = NetworkRequestData(urlSuffix: urlSuffix, method: method, parameters: parameters, headers: nil, needAuthorization: true)

        super.init(data: data)
    }
}
