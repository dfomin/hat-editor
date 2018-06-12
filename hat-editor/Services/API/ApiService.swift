//
//  ApiService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol ApiService {
    func login(username: String, password: String) -> Observable<PigowlAPIResult<ApiToken>>

    func allPacks() -> Observable<PigowlAPIResult<[PhrasesPack]>>
    func pack(id: Int) -> Observable<PigowlAPIResult<PhrasesPack>>

    func set(review: ReviewStatus, for trackId: Int) -> Observable<PigowlAPIResult<Bool>>
    func update(phrase: Phrase) -> Observable<PigowlAPIResult<Phrase>>
}
