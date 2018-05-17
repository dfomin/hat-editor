//
//  PackItemsProvider.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

extension PhrasesPack: PackItemType {

    // name already exists

    var number: Int {
        return id
    }

}

class PackItemsProvider {
    private(set) var packs: [PhrasesPack] = []

    func update(by packs: [PhrasesPack]) {
        self.packs = packs
    }
}
