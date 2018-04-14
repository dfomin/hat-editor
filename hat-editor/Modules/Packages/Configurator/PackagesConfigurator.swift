//
//  Packages PackagesConfigurator.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class PackagesModuleConfigurator {

    typealias PackagesModuleContext = PackagesInteractorContext // & RouterContext may be

    @discardableResult static func configureModuleFor(viewInput: UIViewController?,
                                                      context: PackagesModuleContext,
                                                      output: PackagesRouterOutput?) -> PackagesRouterInput? {
        if let viewController = viewInput as? PackagesViewController {
            return configure(viewController: viewController, context: context, output: output)
        }
        return nil
    }

    private static func configure(viewController: PackagesViewController,
                                  context: PackagesModuleContext,
                                  output: PackagesRouterOutput?) -> PackagesRouterInput {

        let presenter = PackagesPresenter()
        let interactor = PackagesInteractor(context: context)
        let router = PackagesRouter(moduleInput: presenter, output: output)

        presenter.view = viewController
        presenter.router = router

        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return router
    }

}
