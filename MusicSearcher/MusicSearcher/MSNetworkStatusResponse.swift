//
//  MSNetworkStatusResponse.swift
//  MusicSearcher
//
//  Created by ApplePie on 09.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

enum MSNetworkStatusResponse: Int {
    
    case success = 200
    
    case badRequest = 400
    
    case unauthorized = 401
    
    case forbidden = 403
    
    case notFound = 404
    
    case notAcceptable = 406
    
    case conflict = 409
    
    case gone = 410
    
    case internalServerError = 500
    
    case notIdentified = 0
}
