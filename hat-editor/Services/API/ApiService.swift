//
//  ApiService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol ApiService {
    func login() -> Observable<PigowlAPIResult<String>>

    func allPacks() -> Observable<PigowlAPIResult<[PhrasesPack]>>
    func pack(id: Int) -> Observable<PigowlAPIResult<PhrasesPack>>
}
