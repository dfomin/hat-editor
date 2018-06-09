//
//  Root RootInteractor.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
import RxSwift

typealias RootInteractorContext = AppContext

class RootInteractor {
    weak var output: RootInteractorOutput!
    private let context: RootInteractorContext

    private let bag = DisposeBag()

    init(context: RootInteractorContext) {
        self.context = context
    }
}

// MARK: - RootInteractorInput

extension RootInteractor: RootInteractorInput {
    func requestServerToken() {
        if Settings.token != nil {
            output.didReceiveServerToken(result: true)
        } else {
            context.loginService.loginInput.onNext(())

            context.loginService.loginOutput.subscribe(onNext: { result in
                Settings.token = result
                self.output.didReceiveServerToken(result: true)
            }).disposed(by: bag)

            context.loginService.errorOutput.subscribe(onNext: { [unowned self] error in
                self.output.didReceiveServerToken(result: false)
            }).disposed(by: bag)
        }
    }
}
