//
//  MSiTunesTableViewController.swift
//  MusicSearcher
//
//  Created by ApplePie on 07.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class MSItunesTableViewController: UITableViewController, MSNetworkable {
    
    // MARK: - Fields
    
    private lazy var tracks = [MSTrack]()
    

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("[...] iTunes Table View Controller loaded.")
    }

    
    
    // MARK: - Functions
    
    func searchOnServer(by materials: String) {
        let url = self.collectURL(materials)
        let network = MSNetwork(url: url)
        network.connecting { (data, response, error) in
            guard data != nil && response != nil else {
                print("[...] iTunes data or response is nil")
                print("[...] iTunes error is \(error?.localizedDescription)")
                return
            }
            
            let statusCode = MSNetworkTool.getStatus(response!)
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
            print(jsonDictionary)
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
            }
        }
        else {
            print("[...] JSON parsing is failed.")
        }
    }
    
    private func asyncDownloadArtwork(for cell: UITableViewCell, by url: String) {
        let network = MSNetwork(url: url)
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

    private func collectURL(_ string: String) -> String {
        let newString = string.replacingOccurrences(of: " ", with: "+")
        return MSNetworkConstant.itunes.url + newString +
            MSNetworkConstant.itunes.filter.artist + MSNetworkConstant.chars.and + MSNetworkConstant.itunes.filter.track
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
        asyncDownloadArtwork(for: cell, by: track.artworkUrl)

        return cell
    }
}









