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


    
    // MARK: - Tap action
    
    @IBAction func tapEdit(_ recognizer: UITapGestureRecognizer) {
//        if recognizer.state == UIGestureRecognizerState.ended {
//            let tapLocation = recognizer.location(in: self.tableView)
//            if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
//                if let tappedCell = self.tableView.cellForRow(at: tapIndexPath) as? MSItunesTableViewCell {
//                    print("[>>>] Image touched.")
//                    let originalTransform = tappedCell.albumCover.transform
//                    let scaledTransform = originalTransform.scaledBy(x: 2.2, y: 2.2)
//                    let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0.0, y: 0.0)
//                    UIView.animate(withDuration: 0.7, animations: {
//                        tappedCell.albumCover.transform = scaledAndTranslatedTransform
//                    })
//                }
//            }
//        }
    }
    
    
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









