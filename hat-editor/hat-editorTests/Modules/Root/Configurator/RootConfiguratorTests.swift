//
//  RootRootConfiguratorTests.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 01/04/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import XCTest
@testable import hat_editor

class RootModuleConfiguratorTests: XCTestCase {

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
        let viewController = RootViewControllerMock()
        let context = MockAppContext()

        //when
        _ = RootModuleConfigurator
            .configureModuleFor(viewInput: viewController, context: context, output: nil)

        //then
        XCTAssertNotNil(viewController.output, "RootViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RootPresenter, "output is not RootPresenter")

        let presenter: RootPresenter? = viewController.output as? RootPresenter
        XCTAssertNotNil(presenter?.view, "view in RootPresenter is nil after configuration")
        XCTAssertNotNil(presenter?.router, "router in RootPresenter is nil after configuration")
        XCTAssertTrue(presenter?.router is RootRouter, "router is not RootRouter")

        let interactor: RootInteractor? = presenter?.interactor as? RootInteractor
        XCTAssertNotNil(interactor?.output, "output in RootInteractor is nil after configuration")
    }

    class RootViewControllerMock: RootViewController {
    }
}
