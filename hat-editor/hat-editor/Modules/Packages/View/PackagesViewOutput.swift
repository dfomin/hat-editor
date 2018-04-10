//
//  Packages PackagesViewOutput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol PackagesViewOutput {
    func viewIsReady()
    func refreshPackagesList()

    func viewDidAskRowsNumber() -> Int
    func viewDidAskModel(for row: Int) -> PackageItemType
    func viewDidSelect(row: Int)
}
