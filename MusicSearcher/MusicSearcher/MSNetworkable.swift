//
//  MSNetworkable.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

protocol MSNetworkable {
    
    func searchOnServer(by materials: String)
    
    func parseResponse(json: Data)
    
    func asyncDownloadArtwork(for cell: UITableViewCell, by url: String)
    
    func clearPreviousResult()
    
    func collectPlatformURL(by searchText: String) -> String

}
