//
//  MSNetworkConstant.swift
//  MusicSearcher
//
//  Created by ApplePie on 07.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class MSNetworkConstant {
    
    struct itunes {
        static let url: String = "https://itunes.apple.com/search?term="
        
        struct filter {
            static let track: String = "&entity=musicTrack"
            static let artist: String = "&entity=musicArtist"
        }
    }

    struct lastfm {
        static let url: String = "http://ws.audioscrobbler.com/2.0/"
        static let key: String = "&api_key=545e6ddf0eb4542e9362e0f5e70a4059"
        
        struct format {
            static let json: String = "&format=json"
        }
        
        struct filter {
            static let track: String = "?method=track.search&track="
        }
    }
}
