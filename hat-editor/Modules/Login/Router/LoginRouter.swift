//
//  Login LoginRouter.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class LoginRouter {
	private weak var output: LoginRouterOutput?
	private weak var moduleInput: LoginModuleInput?
    private weak var navigator: BaseNavigator?
    private let context: AppContext

    init(moduleInput: LoginModuleInput, navigator: BaseNavigator, context: AppContext, output: LoginRouterOutput?) {
		self.moduleInput = moduleInput
        self.navigator = navigator
        self.context = context
		self.output = output
	}
}

// MARK: - LoginRouterInternalInput implementation

extension LoginRouter: LoginRouterInternalInput {
    func presentPacks() {
        let navigationController: UINavigationController = UIStoryboard.Pigowl.packs.instance.initialViewController()
        let packsController = navigationController.viewControllers.first
        PacksModuleConfigurator.configureModuleFor(viewInput: packsController, context: context, output: nil)
        navigator?.present(viewController: navigationController)
    }
}
