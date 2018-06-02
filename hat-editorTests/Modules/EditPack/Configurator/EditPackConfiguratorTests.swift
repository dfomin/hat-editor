//
//  EditPackEditPackConfiguratorTests.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 26/05/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import XCTest
@testable import hat_editor

class EditPackModuleConfiguratorTests: XCTestCase {

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
        let viewController = EditPackViewControllerMock()
        let context = MockAppContext()

        //when
        _ = EditPackModuleConfigurator
            .configureModuleFor(viewInput: viewController, context: context, output: nil)

        //then
        XCTAssertNotNil(viewController.output, "EditPackViewController is nil after configuration")
        XCTAssertTrue(viewController.output is EditPackPresenter, "output is not EditPackPresenter")

        let presenter: EditPackPresenter? = viewController.output as? EditPackPresenter
        XCTAssertNotNil(presenter?.view, "view in EditPackPresenter is nil after configuration")
        XCTAssertNotNil(presenter?.router, "router in EditPackPresenter is nil after configuration")
        XCTAssertTrue(presenter?.router is EditPackRouter, "router is not EditPackRouter")

        let interactor: EditPackInteractor? = presenter?.interactor as? EditPackInteractor
        XCTAssertNotNil(interactor?.output, "output in EditPackInteractor is nil after configuration")
    }

    class EditPackViewControllerMock: EditPackViewController {
    }
}
