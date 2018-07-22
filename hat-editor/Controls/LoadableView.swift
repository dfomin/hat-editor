//
//  LoadableView.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 22/07/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import UIKit

@IBDesignable
class LoadableView: UIView {
    @IBInspectable
    var isLoaded: Bool = false {
        didSet {
            backgroundView.isHidden = isLoaded
            self.isUserInteractionEnabled = isLoaded
            if !isLoaded && !spinner.isAnimating {
                spinner.startAnimating()
            }
        }
    }

    private var backgroundView: UIView!
    private var spinner: UIActivityIndicatorView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundView.frame = self.bounds
        spinner.center = backgroundView.center
    }

    private func commonInit() {
        backgroundView = UIView(frame: self.bounds)
        backgroundView.backgroundColor = self.tintColor
        backgroundView.isUserInteractionEnabled = false
        addSubview(backgroundView)

        spinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
        spinner.hidesWhenStopped = false
        backgroundView.addSubview(spinner)
        spinner.startAnimating()
    }
}
