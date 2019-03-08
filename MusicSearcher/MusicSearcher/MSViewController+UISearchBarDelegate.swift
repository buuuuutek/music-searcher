//
//  MSViewController+UISearchBarDelegate.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension MSMainViewController: UISearchBarDelegate {
    
    // MARK: - Properties
    
    var platforms: [MSNetworkable] {
        get {
            return [itunesTableView, lastfmTableView]
        }
    }
    
    
    // MARK: - Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let materials = searchBar.text!
        searchInDifferentPlatforms(materials)
    }
    
    private func searchInDifferentPlatforms(_ materials: String) {
        for platform in platforms {
            platform.searchOnServer(by: materials)
        }
    }
}
