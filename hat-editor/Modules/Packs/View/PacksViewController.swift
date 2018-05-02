//
//  PacksViewController.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class PacksViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private lazy var refreshControl = UIRefreshControl()
    private let assembler = PhrasesCellAssembler()

    var output: PacksViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - PacksViewInput

extension PacksViewController: PacksViewInput {
    func reload() {
        tableView.reloadData()
    }

    func setupInitialState() {
        self.title = L10n.packsTitle
        refreshControl.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.register(PhrasePackCell.nib, forCellReuseIdentifier: PhrasePackCell.reuseId)
    }

    func endRefreshing() {
        refreshControl.endRefreshing()
    }

    func showError(error: Error) {
        let alert = UIAlertController.alertController(type: .error(error.localizedDescription),
                                                      handler: { [unowned self] _ in
            self.output.refreshPacksList()
        })
        present(viewController: alert)
    }
}

// MARK: - UITableView

extension PacksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.viewDidAskRowsNumber()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = output.viewDidAskModel(for: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: PhrasePackCell.reuseId, for: indexPath)
        assembler.configure(cell: cell, by: model)
        return cell
    }
}

extension PacksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output.viewDidSelect(row: indexPath.row)
    }
}

// MARK: - Actions

private extension PacksViewController {
    @IBAction func didRefresh() {
        output.refreshPacksList()
    }
}
