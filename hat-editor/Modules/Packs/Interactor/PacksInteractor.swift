//
//  PacksInteractor.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

typealias PacksInteractorContext = HasPacksService

class PacksInteractor {
    weak var output: PacksInteractorOutput!
    private let context: PacksInteractorContext

    private let bag = DisposeBag()

    private var packs = [PackItem]()

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
            self.packs = result.map { pack in
                PackItem(id: pack.id, name: pack.name, candidates: pack.candidates, accepted: pack.accepted, toEdit: pack.toEdit, rejected: pack.rejected)
            }

            self.output.didUpdate()
        }).disposed(by: bag)

        context.packsService.errorOutput.subscribe(onNext: { [unowned self] error in
            self.output.didFail(with: error)
        }).disposed(by: bag)
    }

    var numberOfPacks: Int {
        return packs.count
    }

    func pack(at index: Int) -> PackItemType {
        return packs[index]
    }
}
