//
//  MSNetworkable.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol MSNetworkable {
    
    func searchOnServer(by materials: String)
    
    func parseResponse(json: Data)
    
}
