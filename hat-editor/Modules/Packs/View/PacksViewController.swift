//
//  PacksViewController.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

// MARK: - PacksTableViewCell

class PacksTableViewCell: UITableViewCell {
    @IBOutlet fileprivate weak var packNameLabel: UILabel!
    @IBOutlet fileprivate weak var extendingView: LoadableView!

    override func prepareForReuse() {
        super.prepareForReuse()

        extendingView.isLoaded = false
    }
}

// MARK: - PacksViewController

class PacksViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()

    var output: PacksViewOutput!

    var isExtendedMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    @objc func refresh() {
        output.refreshPacksList()
    }
}

// MARK: - PacksViewInput

extension PacksViewController: PacksViewInput {
    func reload() {
        tableView.reloadData()
    }

    func setupInitialState() {
        self.title = L10n.packsTitle

        tableView.refreshControl = refreshControl
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

// MARK: - UITableViewDataSource

extension PacksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.viewDidAskRowsNumber()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PacksTableViewCell.reuseId, for: indexPath) as? PacksTableViewCell else {
            return UITableViewCell()
        }

        let model = output.viewDidAskModel(for: indexPath.row)

        cell.packNameLabel.text = model.name

        return cell
    }
}

// MARK: - UITableViewDelegate

extension PacksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        //output.viewDidSelect(row: indexPath.row)

        guard let cell = tableView.cellForRow(at: indexPath) as? PacksTableViewCell else { return }

        cell.extendingView.isLoaded = !cell.extendingView.isLoaded
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExtendedMode {
            return 88
        } else {
            return 44
        }
    }
}

// MARK: - Actions

private extension PacksViewController {
    @IBAction func changeMode(for modeSwitch: UISwitch) {
        tableView.beginUpdates()
        isExtendedMode = modeSwitch.isOn
        tableView.endUpdates()
    }
}
