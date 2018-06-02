//
//  EditPack EditPackInteractorOutput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol EditPackInteractorOutput: AnyObject {
    func didFail(with error: Error)
    func didUpdatePack()
}
