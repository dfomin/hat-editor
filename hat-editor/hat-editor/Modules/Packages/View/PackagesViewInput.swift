//
//  Packages PackagesViewInput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol PackagesViewInput: AnyObject {
    func setupInitialState()
    func showError(error: Error)
}
