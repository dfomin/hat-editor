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

    private weak var packagesInput: PackagesRouterInput?

	init(moduleInput: RootModuleInput, navigator: BaseNavigator, context: RootRouterContext, output: RootRouterOutput?){
		self.moduleInput = moduleInput
        self.navigator = navigator
        self.context = context
		self.output = output
	}
}

// MARK: - RootRouterInternalInput implementation

extension RootRouter: RootRouterInternalInput {
    func presentPackages() {
        let navigationController: UINavigationController = UIStoryboard.Pigowl.packages.instance.initialViewController()
        let packagesController = navigationController.viewControllers.first
        packagesInput = PackagesModuleConfigurator
            .configureModuleFor(viewInput: packagesController, context: context, output: self)
        navigator?.present(viewController: navigationController)
    }

    func presentLogin() {
        // complete in the future if needed
    }
}

// MARK: - PackagesRouterOutput

extension RootRouter: PackagesRouterOutput {
    
}
