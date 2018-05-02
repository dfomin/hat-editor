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

    private let dataProvider = PackItemsProvider()
}

// MARK: - PacksViewOutput

extension PacksPresenter: PacksViewOutput {
    func viewDidAskRowsNumber() -> Int {
        return dataProvider.data.count
    }

    func viewDidAskModel(for row: Int) -> PackItemType {
        return dataProvider.data[row]
    }

    func viewDidSelect(row: Int) {
        router.showPackScene(for: dataProvider.packs[row])
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

    func didUpdate(packs: [PhrasesPack]) {
        dataProvider.update(by: packs)
        view.reload()
        view.endRefreshing()
    }
}
