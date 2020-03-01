//
//  PlaybackButtons.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Buttons: UIViewController
{
    @IBOutlet weak var playButton: PlayButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    let player: AudioPlayer
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    
    init(player: AudioPlayer) {
        self.player = player
        super.init(nibName: "Buttons", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: player)
        notifications.addObserver(self, selector: #selector(playerDidPlay), name: .didPlay, object: player)
        notifications.addObserver(self, selector: #selector(playerDidPause), name: .didPause, object: player)

    }
    required init?(coder: NSCoder) { fatalError() }
    
    @objc func playerDidLoad(notification: Notification) {
        //FIXME: enable buttons?
    }
    
    @objc func playerDidPlay(notification: Notification) {
        playButton.nextState()  //FIXME: Update playButton API
    }
    
    @objc func playerDidPause(notification: Notification) {
        playButton.nextState()  //FIXME: Update playButton API
    }
    
    @IBAction func previous(_ sender: AnyObject) { player.previous() }
    
    @IBAction func next(_ sender: AnyObject) { player.next() }
}
