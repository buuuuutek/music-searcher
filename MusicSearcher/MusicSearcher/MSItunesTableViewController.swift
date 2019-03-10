//
//  MSiTunesTableViewController.swift
//  MusicSearcher
//
//  Created by ApplePie on 07.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class MSItunesTableViewController: UITableViewController {
    
    // MARK: - Fields
    
    lazy var tracks = [MSTrack]()
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunes", for: indexPath) as! MSItunesTableViewCell

        let track = tracks[indexPath.row]
        cell.groupLabel.text = track.artist
        cell.songLabel.text = track.name
        self.asyncDownloadArtwork(for: cell, by: track.artworkUrl)

        return cell
    }
}









