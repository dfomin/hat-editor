//
//  Login LoginViewOutput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol LoginViewOutput {
    func viewIsReady()
    func login(username: String, password: String)
}
