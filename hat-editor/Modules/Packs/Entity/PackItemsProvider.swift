//
//  PackItemsProvider.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

class PackItemsProvider {
    private (set) var data: [PackItemType] = []
    private (set) var packs: [PhrasesPack] = []

    func update(by packs: [PhrasesPack]) {
        self.packs = packs
        data = packs.map {
            PackItem(number: $0.id, name: $0.name)
        }
    }
}
