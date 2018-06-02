//
//  PacksConfigurator.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class PacksModuleConfigurator {

    typealias PacksModuleContext = PacksInteractorContext // & RouterContext may be

    @discardableResult static func configureModuleFor(viewInput: UIViewController?,
                                                      context: PacksModuleContext,
                                                      output: PacksRouterOutput?) -> PacksRouterInput? {
        if let viewController = viewInput as? PacksViewController {
            return configure(viewController: viewController, context: context, output: output)
        }
        return nil
    }

    private static func configure(viewController: PacksViewController,
                                  context: PacksModuleContext,
                                  output: PacksRouterOutput?) -> PacksRouterInput {

        let presenter = PacksPresenter()
        let interactor = PacksInteractor(context: context)
        let router = PacksRouter(moduleInput: presenter, navigator: viewController, context: context, output: output)

        presenter.view = viewController
        presenter.router = router

        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return router
    }

}
