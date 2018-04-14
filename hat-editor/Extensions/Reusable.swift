//
//  Reusable.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

protocol CellReuseIdentifiable: class {
    static var reuseId: String {get}
}

extension CellReuseIdentifiable {
    static var reuseId: String {
        return String(describing: self)
    }
}

protocol NibProvider: CellReuseIdentifiable {
    static var nib: UINib? {get}
}

extension NibProvider {
    static var nib: UINib? {
        return UINib(nibName: reuseId, bundle: Bundle.main)
    }
}

extension UICollectionReusableView: NibProvider {}
extension UITableViewCell: NibProvider {}
