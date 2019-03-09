//
//  MSTrack.swift
//  MusicSearcher
//
//  Created by ApplePie on 09.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class MSTrack {
    
    // MARK: - Fields
    
    var artist: String
    var name: String
    var artworkUrl: URL?
    // async loading
    var artwork: Data!
    
    
    // MARK: - Initializers
    
    init(name: String, artist: String, artworkUrl: URL?) {
        self.name = name
        self.artist = artist
        self.artworkUrl = artworkUrl
        print("[...] Created '\(name)' track of '\(artist)'.")
    }
}
