//
//  MusicSearcherUITests.swift
//  MusicSearcherUITests
//
//  Created by ApplePie on 11.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import XCTest

class MusicSearcherUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    /// Check that all controls from technical task are exist
    func testSegmentedControl() {
        let app = XCUIApplication()
        
        let segmentedControlLastfm = app.navigationBars.buttons["Last.fm"]
        XCTAssert(segmentedControlLastfm.exists)
        let segmentedControlItunes = app.navigationBars.buttons["iTunes"]
        XCTAssert(segmentedControlItunes.exists)
        
        let searchBar = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .searchField).element
        XCTAssert(searchBar.exists)
        
        let itunesTable = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .cell).element(boundBy: 0).tables["Empty list"]
        XCTAssert(itunesTable.exists)
        app.navigationBars.buttons["Last.fm"].tap()
        let lastfmTable = app.tables["Empty list"]
        XCTAssert(lastfmTable.exists)
    }
}








