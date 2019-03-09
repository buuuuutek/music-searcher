//
//  MSNetwork.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class MSNetwork {
    
    // MARK: - Fields
    
    private var url: String
    
    
    // MARK: - Typealias
    
    typealias ResponseHandler = ((_ : Data?, _ : URLResponse?, _ : Error?) -> Void)
    
    
    // MARK: - Initializers
    
    init(url: String) {
        print("Try to connection by URL (\(url))...")
        self.url = url
    }
    
    
    // MARK: - Functions
    
    func connecting(_ handler: @escaping ResponseHandler) {
        guard let url = URL(string: self.url) else {
            print("Could not make the correct URL.")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: handler).resume()
    }
    
}
