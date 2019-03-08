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

    // Platforms:
    @IBOutlet weak var itunesTableView: MSItunesTableViewController!
    @IBOutlet weak var lastfmTableView: MSLastfmTableViewController!
    
    // IBOutlets
    @IBOutlet weak var platformSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchTrackBar: UISearchBar!
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    // MARK: - Controls Actions
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        loadNeededSegment()
    }
    
    
    
    // MARK: - Functions
    
    private func loadNeededSegment() {
        // iTunes segment was chosen
        if platformSegmentedControl.selectedSegmentIndex == 0 {
            itunesTableView.tableView.isHidden = false
            lastfmTableView.tableView.isHidden = true
        } else {
            itunesTableView.tableView.isHidden = true
            lastfmTableView.tableView.isHidden = false
        }
    }
}

