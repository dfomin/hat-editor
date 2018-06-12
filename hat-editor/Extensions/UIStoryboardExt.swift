//
//  UIStoryboardExt.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum Pigowl: String {
        case root = "Root"
        case packs = "Packs"
        case editPack = "EditPack"
        case editPhrase = "EditPhrase"
        case login = "Login"

        var instance: UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
        }
    }
}

extension UIStoryboard {
    func viewController(with identifier: String) -> UIViewController {
        return instantiateViewController(withIdentifier: identifier)
    }

    func initialViewController<T: UIViewController>(type: T.Type) -> T {
        return instantiateInitialViewController() as! T
    }

    func initialViewController<T: UIViewController>() -> T {
        return instantiateInitialViewController() as! T
    }

    func viewController<T: UIViewController>(type: T.Type) -> T {
        return viewController(with: String(describing: type)) as! T
    }

    func viewController<T: UIViewController>() -> T {
        return viewController(with: String(describing: T.self)) as! T
    }
}
