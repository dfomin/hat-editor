//
//  UIAlertControllerExt.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

extension UIAlertController {
    typealias ActionHandler = ((UIAlertAction) -> Swift.Void)?

    enum AlertType {
        case error(String)
    }

    static func alertController(type: AlertType, handler: ActionHandler = nil) -> UIAlertController {
        switch type {
        case .error(let description):
            return errorAlertController(message: description, handler: handler)
        }
    }
}

private extension UIAlertController {
    static func errorAlertController(message: String, handler: ActionHandler = nil) -> UIAlertController {
        let title = L10n.error
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: L10n.ok, style: .cancel, handler: nil)
        let repeatAction = UIAlertAction(title: L10n.repeat, style: .default, handler: handler)

        alert.addAction(cancel)
        alert.addAction(repeatAction)

        return alert
    }
}
