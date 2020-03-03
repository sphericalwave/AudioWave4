//
//  SecondaryButtons.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-29.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class SecondaryButtons: UIViewController
{
    @IBOutlet weak var loopButton: LoopButton!
    @IBOutlet weak var speedButton: SpeedButton!
    @IBOutlet weak var clockButton: UIButton!
    
    let player: AudioSource
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    
    init(player: AudioSource) {
        self.player = player
        super.init(nibName: "SecondaryButtons", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: nil)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    @objc func playerDidLoad(notification: Notification) {
        //FIXME: enable buttons?
    }
}
