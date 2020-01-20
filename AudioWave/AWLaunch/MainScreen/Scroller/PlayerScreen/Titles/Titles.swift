//
//  Titles.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Titles: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    init() {
        super.init(nibName: "Titles", bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func updateInfoLabels() {
//        if self.player.currentPlaybackItem != nil {
//            self.titleLabel.text = "\(self.player.currentPlaybackItem?.artist ?? "") - \(self.player.currentPlaybackItem?.title ?? "")"
//            self.descriptionLabel.text = "\(self.player.currentPlaybackItem?.albumTitle ?? "")"
//        }
//        else {
//            self.titleLabel.text = ""
//            self.descriptionLabel.text = ""
//        }
    }
}
