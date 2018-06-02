//
//  EditPack EditPackRouter.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class EditPackRouter {
	private weak var output: EditPackRouterOutput?
	private weak var moduleInput: EditPackModuleInput?

	init(moduleInput: EditPackModuleInput, output: EditPackRouterOutput?) {
		self.moduleInput = moduleInput
		self.output = output
	}
}

// MARK: - EditPackRouterInternalInput implementation

extension EditPackRouter: EditPackRouterInternalInput {
    func set(pack: PhrasesPack) {
        moduleInput?.set(pack: pack)
    }
}
