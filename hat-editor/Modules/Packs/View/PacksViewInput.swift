//
//  PacksViewInput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol PacksViewInput: AnyObject {
    func setupInitialState()
    func endRefreshing()
    func showError(error: Error)
    func reload()
}
