//
//  Root RootRouter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

typealias RootRouterContext = AppContext

class RootRouter {
	private weak var output: RootRouterOutput?
	private weak var moduleInput: RootModuleInput?
    private weak var navigator: BaseNavigator?
    private let context: RootRouterContext

    private weak var packsInput: PacksRouterInput?

	init(moduleInput: RootModuleInput, navigator: BaseNavigator, context: RootRouterContext, output: RootRouterOutput?){
		self.moduleInput = moduleInput
        self.navigator = navigator
        self.context = context
		self.output = output
	}
}

// MARK: - RootRouterInternalInput implementation

extension RootRouter: RootRouterInternalInput {
    func presentPacks() {
        let navigationController: UINavigationController = UIStoryboard.Pigowl.packs.instance.initialViewController()
        let packsController = navigationController.viewControllers.first
        packsInput = PacksModuleConfigurator
            .configureModuleFor(viewInput: packsController, context: context, output: self)
        navigator?.present(viewController: navigationController)
    }

    func presentLogin() {
        // complete in the future if needed
    }
}

// MARK: - PacksRouterOutput

extension RootRouter: PacksRouterOutput {
    
}
