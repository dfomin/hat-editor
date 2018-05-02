//
//  PacksConfiguratorTests.swift
//  hat-editor
//
//  Created by Sivykh Mikhail on 25/03/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import XCTest
@testable import hat_editor

class PacksModuleConfiguratorTests: XCTestCase {

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
        let viewController = PacksViewControllerMock()
        let context = MockAppContext()

        //when
        _ = PacksModuleConfigurator
            .configureModuleFor(viewInput: viewController, context: context, output: nil)

        //then
        XCTAssertNotNil(viewController.output, "PacksViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PacksPresenter, "output is not PacksPresenter")

        let presenter: PacksPresenter? = viewController.output as? PacksPresenter
        XCTAssertNotNil(presenter?.view, "view in PacksPresenter is nil after configuration")
        XCTAssertNotNil(presenter?.router, "router in PacksPresenter is nil after configuration")
        XCTAssertTrue(presenter?.router is PacksRouter, "router is not PacksRouter")

        let interactor: PacksInteractor? = presenter?.interactor as? PacksInteractor
        XCTAssertNotNil(interactor?.output, "output in PacksInteractor is nil after configuration")
    }

    class PacksViewControllerMock: PacksViewController {
    }
}
