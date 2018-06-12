//
//  EditPack EditPackViewController.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

let userIcons = [
    "fomin": "🐡",
    "sivykh": "🐷",
    "zhadko": "🐿",
    "tatarintsev": "🐍"
]

class EditPackViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var packTitleLabel: UILabel!

    var output: EditPackViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }

}

// MARK: - EditPackViewInput

extension EditPackViewController: EditPackViewInput {
    func setPack(title: String) {
        packTitleLabel.text = title
    }

    func showError(error: Error) {
        let alert = UIAlertController.alertController(type: .error(error.localizedDescription), handler: nil)
        present(viewController: alert)
    }

    func reload() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension EditPackViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.viewDidAskRowsNumber()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhraseTableViewCell.reuseId, for: indexPath) as? PhraseTableViewCell else {
            assert(false, "Unable to dequeue cell")
            return UITableViewCell()
        }

        cell.delegate = self

        let model = output.viewDidAskModel(for: indexPath.row)

        cell.trackId = model.trackId
        cell.phrase.text = model.phrase
        cell.phraseDescription.text = model.description
        cell.rejectButton.setTitle(generateReviewLabel(for: .delete, with: model), for: .normal)
        cell.editButton.setTitle(generateReviewLabel(for: .edit, with: model), for: .normal)
        cell.acceptButton.setTitle(generateReviewLabel(for: .accept, with: model), for: .normal)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension EditPackViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.viewDidSelect(at: indexPath.row)
    }
}

// MARK: - PhraseTableViewCellDelegate

extension EditPackViewController: PhraseTableViewCellDelegate {
    func set(review: ReviewStatus, for trackId: Int) {
        output.viewDidChangeModel(review: review, for: trackId)
    }
}

// MARK: - Actions

private extension EditPackViewController {
}

private extension EditPackViewController {
    private func generateReviewLabel(for status: ReviewStatus, with model: Phrase) -> String {
        return model.reviews.filter{ $0.status == status }.reduce("") { $0 + userIcons[$1.author]! }
    }
}
