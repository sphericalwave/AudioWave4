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
    let player: MusicPlayer //FIXME: Naming
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    
    init(player: MusicPlayer) {
        self.player = player
        super.init(nibName: "Buttons", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: player)
        notifications.addObserver(self, selector: #selector(playerDidPlay), name: .didPlay, object: player)
        notifications.addObserver(self, selector: #selector(playerDidPause), name: .didPause, object: player)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enable(false)
    }
    
    func enable(_ bool: Bool) {
        playButton.isEnabled = bool
        nextButton.isEnabled = bool
        previousButton.isEnabled = bool
    }
    
    @objc func playerDidLoad(notification: Notification) { enable(true) }
    @objc func playerDidPlay(notification: Notification) { playButton.pause() }
    @objc func playerDidPause(notification: Notification) { playButton.play() }
    @IBAction func previous() { player.previous() }
    @IBAction func next() { player.next() }
    @IBAction func play() {
        if player.isPlaying() { player.pause() }
        else { player.play() }
    }
}
