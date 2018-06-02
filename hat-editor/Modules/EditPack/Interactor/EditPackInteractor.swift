//
//  EditPack EditPackInteractor.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

typealias EditPackInteractorContext = AppContext // & write more precisely

class EditPackInteractor {
    weak var output: EditPackInteractorOutput!

    private let context: EditPackInteractorContext
    private let bag = DisposeBag()

    private var pack: PhrasesPack?

    init(context: EditPackInteractorContext) {
        self.context = context
    }
}

// MARK: - EditPackInteractorInput

extension EditPackInteractor: EditPackInteractorInput {
    var numberOfPhrases: Int {
        return pack?.phrases?.count ?? 0
    }

    func phrase(at index: Int) -> Phrase {
        return Phrase(phrase: "qwe", complexity: 0, description: "qwe", reviews: [])
    }

    func set(pack: PhrasesPack) {
        self.pack = pack
        context.packsService.downloadPack(with: pack.id)
        context.packsService.downloadPackInput.onNext(())
    }

    func subscribe() {
        context.packsService.packsOutput.subscribe(onNext: { [unowned self] result in
            self.output.didUpdatePack()
        }).disposed(by: bag)

        context.packsService.errorOutput.subscribe(onNext: { [unowned self] error in
            self.output.didFail(with: error)
        }).disposed(by: bag)
    }
}
