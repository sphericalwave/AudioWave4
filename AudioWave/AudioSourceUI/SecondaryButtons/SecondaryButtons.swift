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
    let audioSource: AudioSource
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    
    init(audioSource: AudioSource) {
        self.audioSource = audioSource
        super.init(nibName: "SecondaryButtons", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: nil)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enable(false)
    }
    
    @objc func playerDidLoad(notification: Notification) {
        enable(false)   //FIXME: Implement Features
    }
    
    func enable(_ bool: Bool) {
        loopButton.isEnabled = bool
        speedButton.isEnabled = bool
        clockButton.isEnabled = bool
    }
}
