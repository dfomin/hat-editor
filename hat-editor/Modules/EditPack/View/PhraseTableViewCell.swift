//
//  PhraseTableViewCell.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 02/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
import UIKit

class PhraseTableViewCell: UITableViewCell {
    @IBOutlet weak var phrase: UILabel!
    @IBOutlet weak var phraseDescription: UILabel!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }
}

private extension PhraseTableViewCell {
    @IBAction func reject() {
        print("reject")
    }

    @IBAction func edit() {
        print("edit")
    }

    @IBAction func accept() {
        print("accept")
    }
}
