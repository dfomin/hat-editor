//
//  PhraseService.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol PhraseService {
    func update(phrase: Phrase)
    func update(review: Review, for phraseTrackID: Int)

    var errorOutput: Observable<Error> { get }
}
