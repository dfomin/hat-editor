//
//  EditPack EditPackViewOutput.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

protocol EditPackViewOutput {
    func viewIsReady()
    func viewDidAskRowsNumber() -> Int
    func viewDidAskModel(for: Int) -> Phrase
}
