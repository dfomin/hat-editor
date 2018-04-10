//
//  Packages PackagesPresenter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class PackagesPresenter: PackagesModuleInput {
    weak var view: PackagesViewInput!
    var interactor: PackagesInteractorInput!
    var router: PackagesRouterInternalInput!

    private let dataProvider = PackageItemsProvider()
}

// MARK: - PackagesViewOutput

extension PackagesPresenter: PackagesViewOutput {
    func viewDidAskRowsNumber() -> Int {
        return dataProvider.data.count
    }

    func viewDidAskModel(for row: Int) -> PackageItemType {
        return dataProvider.data[row]
    }

    func viewDidSelect(row: Int) {
        router.showPackageScene(for: dataProvider.packages[row])
    }

    func refreshPackagesList() {
        interactor.refreshPackages()
    }

    func viewIsReady() {
        view.setupInitialState()
        interactor.initiate()
        interactor.refreshPackages()
    }
}

// MARK: - PackagesInteractorOutput

extension PackagesPresenter: PackagesInteractorOutput {
    func didFail(with error: Error) {
        view.showError(error: error)
        view.endRefreshing()
    }

    func didUpdate(packages: [PhrasesPackage]) {
        dataProvider.update(by: packages)
        view.reload()
        view.endRefreshing()
    }
}
