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

    @IBOutlet weak var platformSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchTrackBar: UISearchBar!
    
    
    // MARK: - Fields
    
    // Platforms for passing value between vc and contaiter view
    var itunes: MSItunesTableViewController!
    var lastfm: MSLastfmTableViewController!
    
    
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
            itunes.tableView.isHidden = false
            lastfm.tableView.isHidden = true
        } else {
            itunes.tableView.isHidden = true
            lastfm.tableView.isHidden = false
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itunesSegue" {
            let itunesTableViewController = segue.destination as! MSItunesTableViewController
            self.itunes = itunesTableViewController
        }
        if segue.identifier == "lastfmSegue" {
            let lastfmTableViewController = segue.destination as! MSLastfmTableViewController
            self.lastfm = lastfmTableViewController
        }
    }
}

