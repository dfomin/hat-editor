//
//  EditPack EditPackConfigurator.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class EditPackModuleConfigurator {

    typealias EditPackModuleContext = EditPackInteractorContext // & RouterContext may be

    @discardableResult
    static func configureModuleFor(viewInput: UIViewController?,
                                   context: EditPackModuleContext,
                                   output: EditPackRouterOutput?) -> EditPackRouterInput? {

        if let viewController = viewInput as? EditPackViewController {
            return configure(viewController: viewController, context: context, output: output)
        }
        return nil
    }

    private static func configure(viewController: EditPackViewController,
                                  context: EditPackModuleContext,
                                  output: EditPackRouterOutput?) -> EditPackRouterInput {

        let presenter = EditPackPresenter()
        let interactor = EditPackInteractor(context: context)
        let router = EditPackRouter(moduleInput: presenter, navigator: viewController, context: context, output: output)

        presenter.view = viewController
        presenter.router = router

        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return router
    }

}
