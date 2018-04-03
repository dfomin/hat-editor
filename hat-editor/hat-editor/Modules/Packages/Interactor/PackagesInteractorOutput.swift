//
//  Packages PackagesInteractorOutput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

protocol PackagesInteractorOutput: AnyObject {
    func didFail(with error: Error)
    func didUpdate(packages: [PackageContainer])
}
