//
//  MSiTunesTableViewCell.swift
//  MusicSearcher
//
//  Created by ApplePie on 07.03.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class MSItunesTableViewCell: UITableViewCell {

    // MARK: - Controls
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    
    
    // MARK: - Actions
    
//    @IBAction func imageTapped(_ tapGestureRecognizer: UITapGestureRecognizer) {
//        print("[>>>] Image touched.")
//        let originalTransform = albumCover.transform
//        let scaledTransform = originalTransform.scaledBy(x: 2.2, y: 2.2)
//        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0.0, y: 0.0)
//        UIView.animate(withDuration: 0.7, animations: {
//            self.albumCover.transform = scaledAndTranslatedTransform
//        })
//    }
}
