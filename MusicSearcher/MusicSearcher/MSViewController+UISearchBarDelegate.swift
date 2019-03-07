//
//  MSViewController+UISearchBarDelegate.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension MSMainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let network = MSNetwork(searchText: searchBar.text!)
        network.startConnecting()
    }
}
