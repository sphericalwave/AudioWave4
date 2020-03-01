//
//  PlaybackProgress.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Progress: UIViewController
{
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    var timer: Timer?   //FIXME: Nil & Hidden Dependency
    let player: AudioPlayer
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    
    init(player: AudioPlayer) {
        self.player = player
        super.init(nibName: "Progress", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: player)
        notifications.addObserver(self, selector: #selector(playerDidPlay), name: .didPlay, object: player)
        notifications.addObserver(self, selector: #selector(playerDidPause), name: .didPause, object: player)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "ProgressSliderThumb"), for: .normal)
    }
    
    @objc func playerDidLoad(notification: Notification) { slider.value = 0 }
    
    @objc func playerDidPlay(notification: Notification) { startTimer() }
    
    @objc func playerDidPause(notification: Notification) { timer?.invalidate() }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedTimeLabel.text = self.player.elapsedTime()
            self.remainingTimeLabel.text = self.player.remainingTime()
            self.slider.value = self.player.percentage()
        }
    }
    
    @IBAction func sliderChanged(_ sender: AnyObject) {
        player.seekTo(percentage: slider.value)
    }
}


