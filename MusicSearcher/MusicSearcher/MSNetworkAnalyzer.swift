//
//  MSNetworkTool.swift
//  MusicSearcher
//
//  Created by ApplePie on 09.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class MSNetworkAnalyzer {
    
    static func getStatus(_ response: URLResponse) -> MSNetworkStatusResponse {
        if let httpResponse = response as? HTTPURLResponse {
            if let statusCode = MSNetworkStatusResponse(rawValue: httpResponse.statusCode) {
                return statusCode
            } else {
                return .notIdentified
            }
        } else {
            return .notIdentified
        }
    }
    
    static func showOopsAlert(with message: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okay)
        viewController.present(alert, animated: true, completion: nil)
    }
}
