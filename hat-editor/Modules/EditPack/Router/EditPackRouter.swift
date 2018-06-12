//
//  EditPack EditPackRouter.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class EditPackRouter {
	private weak var output: EditPackRouterOutput?
	private weak var moduleInput: EditPackModuleInput?
    private weak var navigator: BaseNavigator?
    private let context: AppContext

    init(moduleInput: EditPackModuleInput, navigator: BaseNavigator, context: AppContext, output: EditPackRouterOutput?) {
		self.moduleInput = moduleInput
        self.navigator = navigator
        self.context = context
		self.output = output
	}
}

// MARK: - EditPackRouterInternalInput implementation

extension EditPackRouter: EditPackRouterInternalInput {
    func set(pack: PhrasesPack) {
        moduleInput?.set(pack: pack)
    }

    func present(phrase: Phrase) {
        let editPhraseViewController = UIStoryboard.Pigowl.editPhrase.instance.initialViewController()
        let input = EditPhraseModuleConfigurator.configureModuleFor(viewInput: editPhraseViewController, context: context, output: nil)
        input?.set(phrase: phrase)
        navigator?.push(viewController: editPhraseViewController)
    }
}
