//
//  PacksRouter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class PacksRouter {
	private weak var output: PacksRouterOutput?
	private weak var moduleInput: PacksModuleInput?
    private weak var navigator: BaseNavigator?
    private let context: AppContext

	init(moduleInput: PacksModuleInput, navigator: BaseNavigator, context: AppContext, output: PacksRouterOutput?) {
		self.moduleInput = moduleInput
		self.output = output
        self.navigator = navigator
        self.context = context
	}
}

// MARK: - PacksRouterInternalInput implementation

extension PacksRouter: PacksRouterInternalInput {
    func showPackScene(for pack: PhrasesPack) {
        let editPackViewController = UIStoryboard.Pigowl.editPack.instance.initialViewController()
        let input = EditPackModuleConfigurator.configureModuleFor(viewInput: editPackViewController, context: context, output: nil)
        input?.set(pack: pack)
        navigator?.push(viewController: editPackViewController)
    }
}
