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
        print("iTunes Table View Controller loaded.")
    }

    
    
    // MARK: - Functions
    
    func searchOnServer(by materials: String) {
        let url = MSNetworkConstant.itunes + materials
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
            if let resultsDictionary = jsonDictionary!["results"] as? [Dictionary<String, Any>] {
                for item in resultsDictionary {
                    let artistName = item["artistName"] as! String
                    let trackName = item["trackName"] as! String
                    let artworkUrl = URL(string: item["artworkUrl100"] as! String)
                    let track = MSTrack(name: trackName, artist: artistName, artworkUrl: artworkUrl)
                    tracks.append(track)
                }
            } else {
                print("[...] Results parsing is failed.")
            }
        }
        else {
            print("[...] JSON parsing is failed.")
        }
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
        
//        Async loading:
//        cell.albumCover.image =

        return cell
    }
}









