//
//  PlaybackProgress.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class ProgressUI: UIViewController
{
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    var timer: Timer?   //FIXME: Nil & Hidden Dependency
    let audioSource: AudioSource //FIXME: Naming
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    var displayLink: CADisplayLink? //FIXME: Nil & Hidden Dependency, FIXME: Remove from Run Loop, FIXME: Disable offscreen

    init(audioSource: AudioSource) {
        self.audioSource = audioSource
        super.init(nibName: "ProgressUI", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: audioSource)
        notifications.addObserver(self, selector: #selector(playerDidPlay), name: .didPlay, object: audioSource)
        notifications.addObserver(self, selector: #selector(playerDidPause), name: .didPause, object: audioSource)
        displayLink = CADisplayLink(target: self, selector: #selector(refresh))
        displayLink?.add(to: .current, forMode: .default)
        displayLink?.isPaused = true
    }
    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        //slider.setThumbImage(#imageLiteral(resourceName: "ProgressSliderThumb"), for: .normal)
    }
    
    @IBAction func sliderChanged(_ sender: AnyObject) { audioSource.seekTo(percentage: slider.value) }
    @objc func playerDidLoad(notification: Notification) { slider.value = 0 }
    @objc func playerDidPlay(notification: Notification) { displayLink?.isPaused = false }
    @objc func playerDidPause(notification: Notification) { displayLink?.isPaused = true }
    @objc func refresh() {
            self.elapsedTimeLabel.text = self.audioSource.elapsedTime()
            self.remainingTimeLabel.text = self.audioSource.remainingTime()
            self.slider.value = self.audioSource.percentage()
    }
}


