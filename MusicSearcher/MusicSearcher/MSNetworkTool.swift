//
//  MSNetworkTool.swift
//  MusicSearcher
//
//  Created by ApplePie on 09.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class MSNetworkTool {
    
    static func getStatus(_ response: URLResponse) -> MSNetworkStatusResponse {
        if let httpResponse = response as? HTTPURLResponse {
            if let statusCode = MSNetworkStatusResponse(rawValue: httpResponse.statusCode) {
                return statusCode
            } else {
                return .notIdentified
            }
        } else {
            return .notIdentified
        }
    }
}
