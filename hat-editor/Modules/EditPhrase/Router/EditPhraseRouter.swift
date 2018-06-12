//
//  EditPhrase EditPhraseRouter.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class EditPhraseRouter {
	private weak var output: EditPhraseRouterOutput?
	private weak var moduleInput: EditPhraseModuleInput?
    private weak var navigator: BaseNavigator?

    init(moduleInput: EditPhraseModuleInput, navigator: BaseNavigator, output: EditPhraseRouterOutput?) {
		self.moduleInput = moduleInput
        self.navigator = navigator
		self.output = output
	}
}

// MARK: - EditPhraseRouterInternalInput implementation

extension EditPhraseRouter: EditPhraseRouterInternalInput {
    func set(phrase: Phrase) {
        moduleInput?.set(phrase: phrase)
    }

    func pop() {
        navigator?.pop()
    }
}
