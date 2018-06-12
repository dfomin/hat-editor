//
//  EditPhrase EditPhraseViewController.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

class EditPhraseViewController: UIViewController {

    @IBOutlet private weak var phraseTextField: UITextField!
    @IBOutlet private weak var descriptionTextView: UITextView!

    var output: EditPhraseViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        output.viewIsReady()
    }

}

// MARK: - EditPhraseViewInput

extension EditPhraseViewController: EditPhraseViewInput {
    func setupInitialState(title: String, description: String) {
        phraseTextField.text = title
        descriptionTextView.text = description
    }
}

// MARK: - Actions

private extension EditPhraseViewController {
    @IBAction func save() {
        guard let phrase = phraseTextField.text, let description = descriptionTextView.text else {
            // TODO: internal inconsistency
            return
        }

        output.update(phrase: phrase, description: description)
    }
}

private extension EditPhraseViewController {
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.size.height -= keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.size.height = +keyboardSize.height
        }
    }
}
