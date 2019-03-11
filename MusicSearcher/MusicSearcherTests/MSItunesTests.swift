//
//  MSItunesTests.swift
//  MusicSearcher
//
//  Created by ApplePie on 11.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import XCTest
@testable import MusicSearcher

class MSItunesTests: XCTestCase {
    
    // MARK: - Constants
    
    let correctItunesURL: String = "https://itunes.apple.com/search?term=maroon&entity=musicArtist&entity=musicTrack"
    
    
    // MARK: - Fields
    
    var networkSession: URLSession!
    var networkObject: MSNetworkable!
    
    
    // MARK: - Functions
    
    override func setUp() {
        super.setUp()
        networkSession = URLSession.shared
    }
    
    override func tearDown() {
        networkSession = nil
        super.tearDown()
    }
    
    func testItunesStatusResponse200() {
        // given
        let url = URL(string: correctItunesURL)
        
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = networkSession.dataTask(with: url!) { data, response, error in
            // then
            guard data != nil, response != nil else {
                XCTFail("Error: \(error?.localizedDescription)")
                return
            }
            
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCorrectCollectingItunesURL() {
        // given
        networkObject = MSItunesTableViewController()
        
        // when
        let url = networkObject.collectPlatformURL(by: "maroon")
        
        // then
        XCTAssert(url == correctItunesURL)
    }
}






