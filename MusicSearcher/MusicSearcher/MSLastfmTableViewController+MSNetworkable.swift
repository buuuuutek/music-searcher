//
//  MSLastfmTableViewController+MSNetworkable.swift
//  MusicSearcher
//
//  Created by ApplePie on 10.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension MSLastfmTableViewController: MSNetworkable {
    
    // MARK: - Functions
    
    func searchOnServer(by materials: String) {
        self.clearPreviousResult()
        
        let url = self.collectPlatformURL(by: materials)
        let network = MSNetwork(url: url)
        network.connecting { (data, response, error) in
            guard data != nil && response != nil else {
                print("[...] Last.fm data or response is nil")
                print("[...] Last.fm error is \(error?.localizedDescription)")
                return
            }

            let statusCode = MSNetworkTool.getStatus(response!)
            if statusCode == .success {
                print("[...] Last.fm response is success.")
                self.parseResponse(json: data!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("[...] Last.fm status code is \(statusCode.rawValue)")
            }
        }
    }
    
    func parseResponse(json: Data) {
        print("[...] Trying to parse response data...")
        
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: json) as? [String: Any] else {
            print("[...] JSON parsing is failed.")
            return
        }
        
        guard let resultsDictionary = jsonDictionary!["results"] as? [String: Any] else {
            print("[...] Results parsing is failed.")
            return
        }
        
        guard let trackmatches = resultsDictionary["trackmatches"] as? [String: Any] else {
            print("[...] Trackmatches is empty.")
            return
        }
        
        guard let jsonTracks = trackmatches["track"] as? [Dictionary<String, Any>] else {
            print("[...] JSON doesn't have tracks.")
            return
        }

        for item in jsonTracks {
            let artistName = item["artist"] as! String
            let trackName = item["name"] as! String
            let artworkUrl = getNeededUrl(with: "large", from: item)

            let track = MSTrack(name: trackName, artist: artistName, artworkUrl: artworkUrl)
            tracks.append(track)
        }
        print("[...] Parsing process competed successfully.")

    }
    
    func asyncDownloadArtwork(for cell: UITableViewCell, by url: String) {
        let network = MSNetwork(url: url)
        network.connecting { (data, response, error) in
            guard data != nil && response != nil else {
                print("[...] Downloading Last.fm artwork data or response is nil")
                print("[...] Downloading Last.fm artwork error is \(error?.localizedDescription)")
                return
            }
            
            let cell = cell as! MSLastfmTableViewCell
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
        return MSNetworkConstant.lastfm.url + MSNetworkConstant.lastfm.filter.track + searchText +
            MSNetworkConstant.lastfm.key + MSNetworkConstant.lastfm.format.json
    }
    
    private func getNeededUrl(with size: String, from json: Dictionary<String, Any>) -> String {
        if let imagesArray = json["image"] as? [Dictionary<String, Any>] {
            for image in imagesArray {
                if (image["size"] as! String) == size {
                    return image["#text"] as! String
                }
            }
            
            print("[...] Images array doesn't have URL with needed size.")
            return String()
        } else {
            print("[...] JSON doesn't have images array.")
            return String()
        }
    }
}




