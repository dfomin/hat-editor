//
//  Packages PackagesViewController.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class PackagesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private lazy var refreshControl = UIRefreshControl()

    var output: PackagesViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - PackagesViewInput

extension PackagesViewController: PackagesViewInput {
    func setupInitialState() {
        self.title = L10n.packagesTitle

        refreshControl.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    func showError(error: Error) {
        let alert = UIAlertController.alertController(type: .error(error.localizedDescription),
                                                      handler: { [unowned self] _ in
            self.output.refreshPackagesList()
        })
        present(viewController: alert)
    }
}

// MARK: - Actions

private extension PackagesViewController {
    @IBAction func didRefresh() {
        output.refreshPackagesList()
    }
}
