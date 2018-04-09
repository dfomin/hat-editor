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
}

// MARK: - PackagesViewOutput

extension PackagesPresenter: PackagesViewOutput {
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
        view.endRefreshing()
    }
}
