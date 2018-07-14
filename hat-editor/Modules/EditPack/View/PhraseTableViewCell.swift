//
//  PhraseTableViewCell.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 02/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
import UIKit

protocol PhraseTableViewCellDelegate: class {
    func set(review: ReviewStatus, for trackId: Int)
}

class PhraseTableViewCell: UITableViewCell {
    @IBOutlet weak var phrase: UILabel!
    @IBOutlet weak var phraseDescription: UILabel!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!

    var trackId: Int?
    weak var delegate: PhraseTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    override func prepareForReuse() {
        trackId = nil
    }
}

private extension PhraseTableViewCell {
    @IBAction func reject() {
        set(review: .delete)
    }

    @IBAction func edit() {
        set(review: .edit)
    }

    @IBAction func accept() {
        set(review: .accept)
    }

    func set(review: ReviewStatus) {
        if let trackId = trackId {
            delegate?.set(review: review, for: trackId)
        }
    }
}
