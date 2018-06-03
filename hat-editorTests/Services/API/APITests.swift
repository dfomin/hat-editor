//
//  APITests.swift
//  hat-editorTests
//
//  Created by Dmitry Fomin on 02/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import XCTest
import RxSwift
@testable import hat_editor

class APITests: XCTestCase {
    private var api: ApiService!
    private var bag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        api = PigowlAPI()
        bag = DisposeBag()
    }
    
    override func tearDown() {
        bag = nil
        api = nil
        super.tearDown()
    }
    
    func testPacksListObtaining() {
        let resultExpectation = XCTestExpectation(description: "Request should work within 5 second")
        let successExpectation = XCTestExpectation(description: "Request should be correctly parsed")
        api.allPacks().subscribe(onNext: { result in
            resultExpectation.fulfill()
            if case PigowlAPIResult.success(_) = result {
                successExpectation.fulfill()
            }
        }).disposed(by: bag)
        wait(for: [resultExpectation, successExpectation], timeout: 5.0)
    }

    func testFirstPackObtaining() {
        let resultExpectation = XCTestExpectation(description: "Request should work within 5 second")
        let successExpectation = XCTestExpectation(description: "Request should be correctly parsed")
        api.pack(id: 1).subscribe(onNext: { result in
            resultExpectation.fulfill()
            if case PigowlAPIResult.success(_) = result {
                successExpectation.fulfill()
            }
        }).disposed(by: bag)
        wait(for: [resultExpectation, successExpectation], timeout: 5.0)
    }

    func testNonexistentPackObtaining() {
        let resultExpectation = XCTestExpectation(description: "Request should work within 5 second")
        let errorExpectation = XCTestExpectation(description: "Request should be correctly parsed")
        api.pack(id: -1).subscribe(onNext: { result in
            resultExpectation.fulfill()
            if case PigowlAPIResult.error(_) = result {
                errorExpectation.fulfill()
            }
        }).disposed(by: bag)
        wait(for: [resultExpectation, errorExpectation], timeout: 5.0)
    }
}
