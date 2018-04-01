//
//  Root RootConfigurator.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class RootModuleConfigurator {

    typealias RootModuleContext = RootInteractorContext & RootRouterContext

    @discardableResult
    static func configureModuleFor(viewInput: UIViewController?,
                                   context: RootModuleContext,
                                   output: RootRouterOutput?) -> RootRouterInput? {

        if let viewController = viewInput as? RootViewController {
            return configure(viewController: viewController, context: context, output: output)
        }
        return nil
    }

    private static func configure(viewController: RootViewController,
                                  context: RootModuleContext,
                                  output: RootRouterOutput?) -> RootRouterInput {

        let presenter = RootPresenter()
        let interactor = RootInteractor(context: context)
        let router = RootRouter(moduleInput: presenter, navigator: viewController, context: context, output: output)

        presenter.view = viewController
        presenter.router = router

        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return router
    }

}
