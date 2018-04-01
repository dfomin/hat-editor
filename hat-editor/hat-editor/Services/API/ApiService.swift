//
//  ApiService.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25.03.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

protocol ApiService {
    func allPackages() -> Observable<PigowlAPIResult<[PhrasesPackage]>>
}
