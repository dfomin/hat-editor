//
//  PackagesPackagesConfiguratorTests.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import XCTest
@testable import hat_editor

class PackagesModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = PackagesViewControllerMock()
        let context = MockAppContext()

        //when
        _ = PackagesModuleConfigurator
            .configureModuleFor(viewInput: viewController, context: context, output: nil)

        //then
        XCTAssertNotNil(viewController.output, "PackagesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PackagesPresenter, "output is not PackagesPresenter")

        let presenter: PackagesPresenter? = viewController.output as? PackagesPresenter
        XCTAssertNotNil(presenter?.view, "view in PackagesPresenter is nil after configuration")
        XCTAssertNotNil(presenter?.router, "router in PackagesPresenter is nil after configuration")
        XCTAssertTrue(presenter?.router is PackagesRouter, "router is not PackagesRouter")

        let interactor: PackagesInteractor? = presenter?.interactor as? PackagesInteractor
        XCTAssertNotNil(interactor?.output, "output in PackagesInteractor is nil after configuration")
    }

    class PackagesViewControllerMock: PackagesViewController {
    }
}
