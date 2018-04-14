//
//  PackageItemsProvider.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation

class PackageItemsProvider {
    private (set) var data: [PackageItemType] = []
    private (set) var packages: [PhrasesPackage] = []

    func update(by packages: [PhrasesPackage]) {
        self.packages = packages
        data = packages.map {
            PackageItem(number: $0.id, name: $0.name)
        }
    }
}
