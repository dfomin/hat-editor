//
//  EditPhraseEditPhraseConfiguratorTests.swift
//  hat-editor
//
//  Created by Dmitry Fomin on 12/06/2018.
//  Copyright © 2018 Pigowl. All rights reserved.
//

import XCTest
@testable import hat_editor

class EditPhraseModuleConfiguratorTests: XCTestCase {

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
        let viewController = EditPhraseViewControllerMock()
        let context = MockAppContext()

        //when
        _ = EditPhraseModuleConfigurator
            .configureModuleFor(viewInput: viewController, context: context, output: nil)

        //then
        XCTAssertNotNil(viewController.output, "EditPhraseViewController is nil after configuration")
        XCTAssertTrue(viewController.output is EditPhrasePresenter, "output is not EditPhrasePresenter")

        let presenter: EditPhrasePresenter? = viewController.output as? EditPhrasePresenter
        XCTAssertNotNil(presenter?.view, "view in EditPhrasePresenter is nil after configuration")
        XCTAssertNotNil(presenter?.router, "router in EditPhrasePresenter is nil after configuration")
        XCTAssertTrue(presenter?.router is EditPhraseRouter, "router is not EditPhraseRouter")

        let interactor: EditPhraseInteractor? = presenter?.interactor as? EditPhraseInteractor
        XCTAssertNotNil(interactor?.output, "output in EditPhraseInteractor is nil after configuration")
    }

    class EditPhraseViewControllerMock: EditPhraseViewController {
    }
}
