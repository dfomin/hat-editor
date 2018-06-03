//
//  EditPack EditPackViewInput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol EditPackViewInput: AnyObject {
    func setPack(title: String)
    func showError(error: Error)
    func reload()
}
