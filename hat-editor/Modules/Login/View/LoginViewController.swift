//
//  Login LoginViewController.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!

    var output: LoginViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        output.viewIsReady()
    }

}

// MARK: - LoginViewInput

extension LoginViewController: LoginViewInput {
    func setupInitialState() {
    }

    func showTokenError() {
        let alert = UIAlertController.alertController(type: .error("Wrong username or password"))
        present(viewController: alert)
    }
}

// MARK: - Actions

private extension LoginViewController {
    @IBAction func login(_ button: UIButton) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            // TODO: show error, internal inconsistency
            return
        }

        output.login(username: username, password: password)
    }

    @IBAction func textFieldDidChange(_ textField: UITextField) {
        loginButton.isEnabled = usernameTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
    }
}

private extension LoginViewController {
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }
}
