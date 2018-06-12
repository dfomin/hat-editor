//
//  EditPhrase EditPhraseConfigurator.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class EditPhraseModuleConfigurator {

    typealias EditPhraseModuleContext = EditPhraseInteractorContext // & RouterContext may be

    @discardableResult
    static func configureModuleFor(viewInput: UIViewController?,
                                   context: EditPhraseModuleContext,
                                   output: EditPhraseRouterOutput?) -> EditPhraseRouterInput? {

        if let viewController = viewInput as? EditPhraseViewController {
            return configure(viewController: viewController, context: context, output: output)
        }
        return nil
    }

    private static func configure(viewController: EditPhraseViewController,
                                  context: EditPhraseModuleContext,
                                  output: EditPhraseRouterOutput?) -> EditPhraseRouterInput {

        let presenter = EditPhrasePresenter()
        let interactor = EditPhraseInteractor(context: context)
        let router = EditPhraseRouter(moduleInput: presenter, navigator: viewController, output: output)

        presenter.view = viewController
        presenter.router = router

        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return router
    }

}
