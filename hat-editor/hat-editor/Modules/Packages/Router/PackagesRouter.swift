//
//  Packages PackagesRouter.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

class PackagesRouter {
	private weak var output: PackagesRouterOutput?
	private weak var moduleInput: PackagesModuleInput?

	init(moduleInput: PackagesModuleInput, output: PackagesRouterOutput?) {
		self.moduleInput = moduleInput
		self.output = output
	}
}

// MARK: - PackagesRouterInternalInput implementation

extension PackagesRouter: PackagesRouterInternalInput {

}
