//
//  MSItunesTableViewController+MSNetworkable.swift
//  MusicSearcher
//
//  Created by ApplePie on 10.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension MSItunesTableViewController: MSNetworkable {
    
    // MARK: - Functions
    
    func searchOnServer(by materials: String) {
        self.clearPreviousResult()
        
        let url = self.collectPlatformURL(by: materials)
        let network = MSNetwork(url: url, vc: self)
        network.connecting { (data, response, error) in
            guard data != nil && response != nil else {
                print("[...] iTunes data or response is nil")
                print("[...] iTunes error is \(error?.localizedDescription)")
                DispatchQueue.main.async {
                    MSNetworkAnalyzer.showOopsAlert(
                        with: "iTunes couldn't find something like \"\(materials)\"",
                        in: self)
                }
                return
            }
            
            let statusCode = MSNetworkAnalyzer.getStatus(response!)
            if statusCode == .success {
                print("[...] iTunes response is success.")
                self.parseResponse(json: data!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("[...] iTunes status code is \(statusCode.rawValue)")
            }
        }
    }
    
    func parseResponse(json: Data) {
        print("[...] Trying to parse response data...")
        
        if let jsonDictionary = try? JSONSerialization.jsonObject(with: json) as? [String: Any] {
            if let resultsDictionary = jsonDictionary!["results"] as? [Dictionary<String, Any>] {
                for item in resultsDictionary {
                    let artistName = item["artistName"] as! String
                    let trackName = item["trackName"] as! String
                    let artworkUrl = item["artworkUrl100"] as! String
                    let track = MSTrack(name: trackName, artist: artistName, artworkUrl: artworkUrl)
                    tracks.append(track)
                }
                print("[...] Parsing process competed successfully.")
                
            } else {
                print("[...] Results parsing is failed.")
                DispatchQueue.main.async {
                    MSNetworkAnalyzer.showOopsAlert(
                        with: "Something wrong with server response. Please, try again.",
                        in: self)
                }
            }
        }
        else {
            print("[...] JSON parsing is failed.")
            DispatchQueue.main.async {
                MSNetworkAnalyzer.showOopsAlert(
                    with: "Something wrong with server response. Please, try again.",
                    in: self)
            }
        }
    }
    
    func asyncDownloadArtwork(for cell: UITableViewCell, by url: String) {
        let network = MSNetwork(url: url, vc: self)
        network.connecting { (data, response, error) in
            guard data != nil && response != nil else {
                print("[...] Downloading iTunes artwork data or response is nil")
                print("[...] Downloading iTunes artwork error is \(error?.localizedDescription)")
                return
            }
            
            let cell = cell as! MSItunesTableViewCell
            print("[...] Trying to loading artwork for \(cell.groupLabel.text!)'s song \(cell.songLabel.text!)")
            
            DispatchQueue.main.async {
                cell.albumCover.image = UIImage(data: data!)
            }
        }
    }
    
    func clearPreviousResult() {
        tracks.removeAll()
        tableView.reloadData()
    }
    
    func collectPlatformURL(by searchText: String) -> String {
        let newString = searchText.replacingOccurrences(of: " ", with: "+")
        return (MSNetworkConstant.itunes.url + newString) +
            (MSNetworkConstant.itunes.filter.artist + MSNetworkConstant.itunes.filter.track)
    }
}
