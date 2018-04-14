//
//  RxOptional.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 10.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import Foundation
import RxSwift

protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    /// Cast `Optional<Wrapped>` to `Wrapped?`
    public var value: Wrapped? {
        return self
    }
}

extension ObservableType where E: OptionalType {
    /**
     Unwraps and filters out `nil` elements.

     - returns: `Observable` of source `Observable`'s elements, with `nil` elements filtered out.
     */
    func skipNil() -> Observable<E.Wrapped> {
        return self.flatMap { element -> Observable<E.Wrapped> in
            guard let value = element.value else {
                return Observable<E.Wrapped>.empty()
            }
            return Observable<E.Wrapped>.just(value)
        }
    }
}
