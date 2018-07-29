//
//  PacksPresenter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class PacksPresenter: PacksModuleInput {
    weak var view: PacksViewInput!
    var interactor: PacksInteractorInput!
    var router: PacksRouterInternalInput!
}

// MARK: - PacksViewOutput

extension PacksPresenter: PacksViewOutput {
    func viewDidAskRowsNumber() -> Int {
        return interactor.numberOfPacks
    }

    func viewDidAskModel(at index: Int) -> PackItemType {
        return interactor.pack(at: index)
    }

    func viewDidSelect(at index: Int) {
        router.showPackScene(for: interactor.pack(at: index).id)
    }

    func refreshPacksList() {
        interactor.refreshPacks()
    }

    func viewIsReady() {
        view.setupInitialState()
        interactor.initiate()
        interactor.refreshPacks()
    }
}

// MARK: - PacksInteractorOutput

extension PacksPresenter: PacksInteractorOutput {
    func didFail(with error: Error) {
        view.showError(error: error)
        view.endRefreshing()
    }

    func didUpdate() {
        view.reload()
        view.endRefreshing()
    }
}
