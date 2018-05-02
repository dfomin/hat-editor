//
//  PacksViewOutput.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol PacksViewOutput {
    func viewIsReady()
    func refreshPacksList()

    func viewDidAskRowsNumber() -> Int
    func viewDidAskModel(for row: Int) -> PackItemType
    func viewDidSelect(row: Int)
}
