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
    let audioSource: AudioSource //FIXME: Naming
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    
    init(audioSource: AudioSource) {
        self.audioSource = audioSource
        super.init(nibName: "Buttons", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: audioSource)
        notifications.addObserver(self, selector: #selector(playerDidPlay), name: .didPlay, object: audioSource)
        notifications.addObserver(self, selector: #selector(playerDidPause), name: .didPause, object: audioSource)
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
    @IBAction func previous() { audioSource.previous() }
    @IBAction func next() { audioSource.next() }
    @IBAction func play() {
        if audioSource.isPlaying() { audioSource.pause() }
        else { audioSource.play() }
    }
}
