//
//  MSNetwork.swift
//  MusicSearcher
//
//  Created by ApplePie on 08.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class MSNetwork {
    
    // MARK: - Fields
    
    private var url: String
    private var vc: UIViewController
    
    
    // MARK: - Typealias
    
    typealias ResponseHandler = ((_ : Data?, _ : URLResponse?, _ : Error?) -> Void)
    
    
    // MARK: - Initializers
    
    init(url: String, vc: UIViewController) {
        // Debug log:
        // print("[...] Try to connection by URL (\(url))...")
        self.url = url
        self.vc = vc
    }
    
    
    // MARK: - Functions
    
    func connecting(_ handler: @escaping ResponseHandler) {
        guard let url = URL(string: self.url) else {
            print("Could not make the correct URL.")
            MSNetworkAnalyzer.showOopsAlert(
                with: "Application couldn't collect the correct URL. Try again or change your search request.",
                in: self.vc)
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: handler).resume()
    }
    
}
