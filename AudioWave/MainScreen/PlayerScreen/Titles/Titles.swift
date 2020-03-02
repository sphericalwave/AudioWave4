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
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    let player: MusicPlayer
    
    init(player: MusicPlayer) {
        self.player = player
        super.init(nibName: "Titles", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: player)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    @objc func playerDidLoad(notification: Notification) {
        titleLabel.text = player.track()
        descriptionLabel.text = player.artist()
    }
}


