//
//  Root RootViewController.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var output: RootViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.viewDidAppear()
    }
}

// MARK: - RootViewInput

extension RootViewController: RootViewInput {
    func setupInitialState() {
    }

    func showNoTokenError() {
        let alert = UIAlertController.alertController(type: .error("qwe"))
        present(viewController: alert)
    }
}
