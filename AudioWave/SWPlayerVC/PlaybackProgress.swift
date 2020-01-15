//
//  PlaybackProgress.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

#warning("PlaybackProgress isn't a good name")
class PlaybackProgress: UIViewController
{
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "ProgressSliderThumb"), for: .normal)
    }
    
    @IBAction func sliderValueChanged(_ sender: AnyObject) {
        //self.player.seekTo(Double(self.slider.value))
    }
    
    func updateSlider() {
//        self.slider.minimumValue = 0
//        self.slider.maximumValue = Float(self.player.duration ?? 0)
    }
    
    func updateTimeLabels() {
//        if let currentTime = self.player.currentTime, let duration = self.player.duration {
//            self.elapsedTimeLabel.text = self.humanReadableTimeInterval(currentTime)
//            self.remainingTimeLabel.text = "-" + self.humanReadableTimeInterval(duration - currentTime)
//        }
//        else {
//            self.elapsedTimeLabel.text = ""
//            self.remainingTimeLabel.text = ""
//        }
    }
    
//    func configureTimer() {
//        self.timer = Timer.every(0.1.seconds) { [weak self] in
//            guard let sself = self else { return }
//            
//            if !sself.slider.isTracking {
//                sself.slider.value = Float(sself.player.currentTime ?? 0)
//            }
//            
//            sself.updateTimeLabels()
//        }
//    }
}
