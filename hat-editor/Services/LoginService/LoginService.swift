//
//  LoginService.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 09/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol LoginService {
    var loginInput: AnyObserver<Void> { get }

    var loginOutput: Observable<String> { get }
    var errorOutput: Observable<Error> { get }
}
