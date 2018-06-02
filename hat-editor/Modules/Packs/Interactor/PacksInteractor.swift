//
//  PacksInteractor.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

typealias PacksInteractorContext = AppContext // & write more precisely

class PacksInteractor {
    weak var output: PacksInteractorOutput!
    private let context: PacksInteractorContext

    private let bag = DisposeBag()

    init(context: PacksInteractorContext) {
        self.context = context
    }
}

// MARK: - PacksInteractorInput

extension PacksInteractor: PacksInteractorInput {
    func refreshPacks() {
        context.packsService.refreshPacksInput.onNext(())
    }

    func initiate() {
        context.packsService.packsOutput.subscribe(onNext: { [unowned self] result in
            self.output.didUpdate(packs: result)
        }).disposed(by: bag)

        context.packsService.errorOutput.subscribe(onNext: { [unowned self] error in
            self.output.didFail(with: error)
        }).disposed(by: bag)
    }
}
