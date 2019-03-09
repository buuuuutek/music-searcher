//
//  ViewController.swift
//  MusicSearcher
//
//  Created by ApplePie on 07.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class MSMainViewController: UIViewController {
    
    // MARK: - Controls

    @IBOutlet weak var itunesTableView: UIView!
    @IBOutlet weak var lastfmTableView: UIView!
    @IBOutlet weak var platformSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchTrackBar: UISearchBar!
    
    
    
    // MARK: - Fields
    
    lazy var platforms = [MSNetworkable]()

    
    
    // MARK: - Controls Actions
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        loadNeededSegment()
    }
    
    
    
    // MARK: - Functions
    
    private func loadNeededSegment() {
        // iTunes segment was chosen
        if platformSegmentedControl.selectedSegmentIndex == 0 {
            itunesTableView.isHidden = false
            lastfmTableView.isHidden = true
        } else {
            itunesTableView.isHidden = true
            lastfmTableView.isHidden = false
        }
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itunesSegue" {
            let itunes = segue.destination as! MSItunesTableViewController
            platforms.append(itunes)
        }
        if segue.identifier == "lastfmSegue" {
            let lastfm = segue.destination as! MSLastfmTableViewController
            platforms.append(lastfm)
        }
    }
}

