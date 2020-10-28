//
//  NikeUITests.swift
//  NikeUITests
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import XCTest

class NikeUITests: XCTestCase {
    
    var app: XCUIApplication?
    
    override func setUp() {
        app = XCUIApplication()
        app?.launch()
        continueAfterFailure = false
    }
    
    /// Checks if tableView and cells exist for TopAlbumViewController
    func test_topAlbumsTableExists() {
        let topAlbumsTableView = app?.tables["TopAlbumsTableView"]
        let cell = topAlbumsTableView?.staticTexts.element(boundBy: 1)
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: cell, handler: nil)
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssertNotNil(topAlbumsTableView)
        XCTAssertNotNil(cell)
    }
    
    /// Checks if TopAlbumViewController successfully navigates to AlbumDetailsViewController
    func test_topAlbumsNavigateToAlbumDetails() {
        guard let app = app else {
            XCTFail("XCUIApplication setup failed")
            return
        }
                
        let topAlbumsCell = app.tables["TopAlbumsTableView"].staticTexts.element(boundBy: 1)
        topAlbumsCell.tap()
        
        XCTAssert(app.otherElements["albumDetailsView"].exists)
    }
    
    /// Checks if tapping on Visit Button successfully brings user to album page in  itunes store
    func test_tapViewAlbumButton() {
        // This test is ignored on simulators as they do not have an itunes store
        #if !targetEnvironment(simulator)
            let topAlbumsCell = app?.tables["TopAlbumsTableView"].staticTexts.element(boundBy: 1)
            let exists = NSPredicate(format: "exists == true")
            expectation(for: exists, evaluatedWith: topAlbumsCell, handler: nil)
            waitForExpectations(timeout: 15, handler: nil)
            topAlbumsCell?.tap()
            
            let visitAlbumButton = app?.staticTexts["Visit Album"]
            visitAlbumButton?.tap()
            
            XCTAssertNotNil(app?.tabBars.buttons["Music"])
        #endif
    }
}
