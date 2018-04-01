//
//  RootInitializator.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class RootInitializator: NSObject {
    @IBOutlet private weak var viewController: RootViewController!
    private lazy var context = Context()

    override func awakeFromNib() {
        super.awakeFromNib()
        RootModuleConfigurator.configureModuleFor(viewInput: viewController, context: context, output: nil)
    }
}
