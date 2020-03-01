//
//  PlaybackButtons.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

protocol ButtonDelegate: AnyObject
{
    func play()
    func next()
    func previous()
    func loop()
    func speed(rate: Float)
}

class Buttons: UIViewController
{
    //FIXME: This Class is BIG
    @IBOutlet weak var playButton: PlayButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!

    //weak var delegate: ButtonDelegate?
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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        speedButton.delegate = self
//        loopButton.delegate = self
//        //playButton.delegate = self
//       // guard delegate != nil else { fatalError() }
//    }
    
    @IBAction func previous(_ sender: AnyObject) { player.previous() }
    
    @IBAction func next(_ sender: AnyObject) { player.next() }
}

extension Buttons: SpeedButtonDelegate
{
    func update(speed: Float) {
        print("Update the Player's speed!")
        player.speed(speed) //FIXME: Weird Naming
    }
}

extension Buttons: LoopButtonDelegate
{
    func update(mode: IdeaMode) {
        print("Update the Player's speed!")
    }
}

//extension Buttons: PlayButtonDelegate
//{
//    func update(mode: PlayMode) {
//        if mode == .play {
//            player.play()
//            return
//        }
//        if mode == .pause {
//            player.pause()
//            return
//        }
//    }
//}
