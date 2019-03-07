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
    @IBOutlet weak var itunesTableView: UIView!
    @IBOutlet weak var lastfmTableView: UIView!
    
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
            let vc = segue.destination as! MSItunesTableViewController
            vc.searchText = searchTrackBar.text
        }
    }
}

