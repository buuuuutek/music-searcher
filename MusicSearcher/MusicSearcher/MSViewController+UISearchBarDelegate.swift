//
//  MSViewController+UISearchBarDelegate.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension MSMainViewController: UISearchBarDelegate {
    
    // MARK: - Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        for item in platforms {
            item.searchOnServer(by: searchBar.text!)
        }
    }
}
