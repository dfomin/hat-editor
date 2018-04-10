//
//  PhrasePackageCell.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 11.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class PhrasePackageCell: UITableViewCell {

    @IBOutlet fileprivate weak var number: UILabel!
    @IBOutlet fileprivate weak var verticalSeparator: UIView!
    @IBOutlet fileprivate weak var name: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        verticalSeparator.backgroundColor = .lightGray
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        verticalSeparator.backgroundColor = .lightGray
    }
}

class PhrasesCellAssembler {
    func configure(cell: UITableViewCell, by model: PackageItemType) {
        guard let cell = cell as? PhrasePackageCell else { return }
        cell.number.text = "\(model.number)"
        cell.name.text = model.name
    }
}
