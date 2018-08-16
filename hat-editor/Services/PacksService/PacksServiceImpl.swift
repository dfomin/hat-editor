//
//  PacksServiceImpl.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01.04.2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import RxSwift

class PacksServiceImpl {
    private let store: StoreService

    let allPacksRequest = AllPacksNetworkRequest()
    var packRequests = [Int: PackNetworkRequest]()

    private let errors = PublishSubject<Error>()

    private let bag = DisposeBag()

    init(store: StoreService) {
        self.store = store

        allPacksRequest.responseSubject.subscribe { [weak self] event in
            switch event {
            case .next(NetworkResponse.success(let value)):
                store.packsInput.onNext(value)
            case .error(let error), .next(NetworkResponse.error(let error)):
                self?.errors.onError(error)
            case .completed:
                break
            }
        }.disposed(by: bag)
    }

    func initPackRequest(for packID: Int) -> PackNetworkRequest {
        let packRequest = PackNetworkRequest(id: packID)
        packRequest.responseSubject.subscribe { [weak self] event in
            switch event {
            case .next(NetworkResponse.success(let value)):
                self?.store.packInput.onNext(value)
            case .error(let error), .next(NetworkResponse.error(let error)):
                self?.errors.onError(error)
            case .completed:
                break
            }
        }.disposed(by: bag)

        packRequests[packID] = packRequest

        return packRequest
    }
}

extension PacksServiceImpl: PacksService {
    func refreshPacks() {
        allPacksRequest.schedule()
    }

    func downloadPack(id: Int) {
        if let packRequest = packRequests[id] {
            packRequest.schedule()
        } else {
            let request = initPackRequest(for: id)
            request.schedule()
        }
    }

    var packsOutput: Observable<[PhrasesPack]> {
        return store.packsOutput
    }

    var errorOutput: Observable<Error> {
        return errors.asObservable()
    }
}
