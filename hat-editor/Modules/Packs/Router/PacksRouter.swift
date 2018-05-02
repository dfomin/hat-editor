//
//  PacksRouter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class PacksRouter {
	private weak var output: PacksRouterOutput?
	private weak var moduleInput: PacksModuleInput?

	init(moduleInput: PacksModuleInput, output: PacksRouterOutput?) {
		self.moduleInput = moduleInput
		self.output = output
	}
}

// MARK: - PacksRouterInternalInput implementation

extension PacksRouter: PacksRouterInternalInput {
    func showPackScene(for package: PhrasesPack) {
        // TODO: create & configure module, push to navigation stack
    }
}
