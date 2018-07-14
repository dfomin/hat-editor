//
//  PhraseService.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol PhraseService {
    var phraseInput: AnyObserver<Phrase> { get }
    var phraseReviewInput: AnyObserver<(Review, Int)> { get }

    var errorOutput: Observable<Error> { get }
}
