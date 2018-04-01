//
//  Packages PackagesInteractor.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

typealias PackagesInteractorContext = AppContext // & write more precisely

class PackagesInteractor {
    weak var output: PackagesInteractorOutput!
    private let context: PackagesInteractorContext

    private let bag = DisposeBag()

    init(context: PackagesInteractorContext) {
        self.context = context
    }
}

// MARK: - PackagesInteractorInput

extension PackagesInteractor: PackagesInteractorInput {
    func refreshPackages() {
        context.packagesService.refreshPackagesInput.onNext(())
    }

    func initiate() {
        context.packagesService.packagesOutput.subscribe(onNext: { [unowned self] result in
            switch result {
            case .success(let value):
                self.output.didUpdate(packages: value)
            case .error(let error):
                self.output.didFail(with: error)
            }
        }).disposed(by: bag)
    }
}
