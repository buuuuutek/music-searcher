//
//  MSTrack.swift
//  MusicSearcher
//
//  Created by ApplePie on 09.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class MSTrack {
    
    // MARK: - Fields
    
    var artist: String
    var name: String
    var artworkUrl: String
    // async loading
    var artwork: UIImage!
    
    
    // MARK: - Initializers
    
    init(name: String, artist: String, artworkUrl: String) {
        self.name = name
        self.artist = artist
        self.artworkUrl = artworkUrl
        // Debug log:
        // print("[...] Created '\(name)' track of '\(artist)'.")
    }
}
