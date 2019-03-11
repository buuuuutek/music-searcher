//
//  MSLastfmTests.swift
//  MusicSearcher
//
//  Created by ApplePie on 11.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import XCTest
@testable import MusicSearcher

class MSLastfmTests: XCTestCase {
    
    // MARK: - Fields
    
    var networkSession: URLSession!
    
    
    
    // MARK: - Functions
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkSession = URLSession.shared
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkSession = nil
        super.tearDown()
    }
    
    func testLastfmStatusResponse200() {
        // given
        let url = URL(string: "http://ws.audioscrobbler.com/2.0/?method=track.search&track=maroon&api_key=545e6ddf0eb4542e9362e0f5e70a4059&format=json")
        
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
}
