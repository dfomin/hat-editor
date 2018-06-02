//
//  EditPack EditPackViewController.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class EditPackViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var output: EditPackViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

}

// MARK: - EditPackViewInput

extension EditPackViewController: EditPackViewInput {
    func setupInitialState() {
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

        let model = output.viewDidAskModel(for: indexPath.row)

        cell.phrase.text = model.phrase

        return cell
    }
}

// MARK: - UITableViewDelegate

extension EditPackViewController: UITableViewDelegate {

}

// MARK: - Actions

private extension EditPackViewController {
//    @IBAction func didTap(button: UIButton) {}
}
