//
//  MSNetwork.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class MSNetwork {
    
    // MARK: - Properties
    
    private var collectedURL: String
    
    
    // MARK: - Initializers
    
    init(searchText: String) {
        self.collectedURL = MSNetworkConstant.itunes + searchText
    }
    
    
    // MARK: - Functions
    
    func startConnecting() {
        guard let url = URL(string: self.collectedURL) else {
            print("Could not make the correct URL.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard data != nil, response != nil else {
                print("Response from \(url.absoluteString) is empty.")
                return
            }
            
            if let stringResponse = String(bytes: data!, encoding: .utf8) {
                print(stringResponse)
            }
        }
        
        task.resume()
    }
}
