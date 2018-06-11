//
//  Login LoginInteractorOutput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput: AnyObject {
    func didReceiveServerToken(result: Bool)
}
