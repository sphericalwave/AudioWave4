//
//  PlaybackButtons.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

protocol ButtonDelegate: AnyObject {
    func play()
    func next()
    func previous()
    func loop()
    func speed(rate: Float)
}

class Buttons: UIViewController
{
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var loopButton: LoopButton!
    @IBOutlet weak var speedButton: SpeedButton!
    weak var delegate: ButtonDelegate?
    
    init() { super.init(nibName: "Buttons", bundle: nil) }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speedButton.delegate = self
        loopButton.delegate = self
        guard delegate != nil else { fatalError() }
    }
    
    @IBAction func play(_ sender: AnyObject) {
       // self.player.togglePlayPause()
        //update UI
        //player.play() or pause
        delegate?.play()
    }
    
    @IBAction func previous(_ sender: AnyObject) {
        //self.player.previousTrack()
        delegate?.previous()
    }
    
    @IBAction func next(_ sender: AnyObject) {
       // self.player.nextTrack()
        delegate?.next()
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

}

extension Buttons: SpeedButtonDelegate
{
    func update(speed: Float) {
        print("Update the Player's speed!")
    }
}

extension Buttons: LoopButtonDelegate
{
    func update(mode: IdeaMode) {
        print("Update the Player's speed!")
    }
}
