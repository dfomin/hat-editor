//
//  Login LoginConfigurator.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class LoginModuleConfigurator {

    typealias LoginModuleContext = LoginInteractorContext // & RouterContext may be

    @discardableResult
    static func configureModuleFor(viewInput: UIViewController?,
                                   context: LoginModuleContext,
                                   output: LoginRouterOutput?) -> LoginRouterInput? {

        if let viewController = viewInput as? LoginViewController {
            return configure(viewController: viewController, context: context, output: output)
        }
        return nil
    }

    private static func configure(viewController: LoginViewController,
                                  context: LoginModuleContext,
                                  output: LoginRouterOutput?) -> LoginRouterInput {

        let presenter = LoginPresenter()
        let interactor = LoginInteractor(context: context)
        let router = LoginRouter(moduleInput: presenter, navigator: viewController, context: context, output: output)

        presenter.view = viewController
        presenter.router = router

        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return router
    }

}
