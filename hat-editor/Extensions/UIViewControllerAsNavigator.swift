//
//  UIViewControllerAsNavigator.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

protocol BaseNavigator: AnyObject {
    func push(viewController: UIViewController)
    func present(viewController: UIViewController)
    func present(viewController: UIViewController, completion: (() -> Void)?)
}

extension UIViewController: BaseNavigator {
    func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    func present(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    func present(viewController: UIViewController, completion: (() -> Void)?) {
        present(viewController, animated: true, completion: completion)
    }
}
