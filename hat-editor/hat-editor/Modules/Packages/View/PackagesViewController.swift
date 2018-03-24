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
    }
}

// MARK: - Actions

private extension PackagesViewController {
//    @IBAction func didTap(button: UIButton) {}
}
