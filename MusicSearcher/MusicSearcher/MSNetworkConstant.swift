//
//  MSNetworkConstant.swift
//  MusicSearcher
//
//  Created by ApplePie on 07.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class MSNetworkConstant {
    
    struct chars {
        static let and: String = "&amp;"
    }
    
    struct itunes {
        static let url: String = "https://itunes.apple.com/search?term="
        
        struct filter {
            static let track: String = "&entity=musicTrack"
            static let artist: String = "&entity=musicArtist"
        }
    }

}
