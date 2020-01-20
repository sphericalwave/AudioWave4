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
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var loopButton: IdeaLoopButton!
    @IBOutlet weak var speedButton: SpeedButton!
    
    init() {
        super.init(nibName: "Buttons", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @IBAction func playPauseButtonAction(_ sender: AnyObject) {
       // self.player.togglePlayPause()
    }
    
    @IBAction func previousButtonAction(_ sender: AnyObject) {
        //self.player.previousTrack()
    }
    
    @IBAction func nextButtonAction(_ sender: AnyObject) {
       // self.player.nextTrack()
    }
    
    func updateControls() {
//        self.playPauseButton.isSelected = self.player.isPlaying
//        self.nextButton.isEnabled = self.player.nextPlaybackItem != nil
//        self.previousButton.isEnabled = self.player.previousPlaybackItem != nil
    }
    
    //TODO: Encapsulate in buttons
//    @IBAction func loopButtonTap(_ sender: IdeaLoopButton) {
//        self.player.loopMode = sender.nextState()
//    }
//    @IBAction func speedButtonTap(_ sender: SpeedButton) {
//        sender.nextState()
//        switch sender.speed {
//        case .normal:
//            self.player.speed = 1
//        case .twentyFivePercentFaster:
//            self.player.speed = 1.25
//        case .fiftyPercentFaster:
//            self.player.speed = 1.5
//        case .seventyFivePercentFaster:
//            self.player.speed = 1.75
//        case .hundredPercentFaster:
//            self.player.speed = 2
//        }
//        //self.player.speed(1)
//    }
    
//    func updateSpeedAndLoop() {
//        switch player.speed {
//        case 1:
//            speedButton.speed = .normal
//        case 1.25:
//            speedButton.speed = .twentyFivePercentFaster
//        case 1.5:
//            speedButton.speed = .fiftyPercentFaster
//        case 1.75:
//            speedButton.speed = .seventyFivePercentFaster
//        case 2:
//            speedButton.speed = .hundredPercentFaster
//        default:
//            speedButton.speed = .normal
//        }
//        switch player.loopMode {
//        case .repeatOne:
//            loopButton.loopMode = .repeatOne
//        case .repeatAll:
//            loopButton.loopMode = .repeatAll
//        case .random:
//            loopButton.loopMode = .random
//        }
//    }
}
