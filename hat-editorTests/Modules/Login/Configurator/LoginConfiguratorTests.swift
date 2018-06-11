//
//  LoginLoginConfiguratorTests.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 11/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import XCTest
@testable import hat_editor

class LoginModuleConfiguratorTests: XCTestCase {

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
        let viewController = LoginViewControllerMock()
        let context = MockAppContext()

        //when
        _ = LoginModuleConfigurator
            .configureModuleFor(viewInput: viewController, context: context, output: nil)

        //then
        XCTAssertNotNil(viewController.output, "LoginViewController is nil after configuration")
        XCTAssertTrue(viewController.output is LoginPresenter, "output is not LoginPresenter")

        let presenter: LoginPresenter? = viewController.output as? LoginPresenter
        XCTAssertNotNil(presenter?.view, "view in LoginPresenter is nil after configuration")
        XCTAssertNotNil(presenter?.router, "router in LoginPresenter is nil after configuration")
        XCTAssertTrue(presenter?.router is LoginRouter, "router is not LoginRouter")

        let interactor: LoginInteractor? = presenter?.interactor as? LoginInteractor
        XCTAssertNotNil(interactor?.output, "output in LoginInteractor is nil after configuration")
    }

    class LoginViewControllerMock: LoginViewController {
    }
}
