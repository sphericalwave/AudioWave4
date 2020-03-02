//
//  AudioSessionManager.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-10.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

//SINGLE RESPONSIBILITY: Manage AudioSession & Handle Interuptions

import Foundation
import MediaPlayer

class AudioHardware
{
    let notifications = NotificationCenter.default //FIXME: Hidden Dependency
    let audioSession: AVAudioSession
    
    init() {
        self.audioSession = AVAudioSession.sharedInstance()
        do { try audioSession.setCategory(AVAudioSession.Category.playback) }
        catch { fatalError() }
        notifications.addObserver(self, selector: #selector(interruption), name: AVAudioSession.interruptionNotification, object: nil)
    }
    
    func activate() {
        do { try audioSession.setActive(true, options: .notifyOthersOnDeactivation) }
        catch { fatalError() }
    }
    
    @objc func interruption(notification: Notification) {
        guard let userInfo = notification.userInfo else { fatalError() }
        guard let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt else { fatalError() }
        guard let type = AVAudioSession.InterruptionType(rawValue: typeValue) else { fatalError() }
        
        if type == .began {
            //pause players
        }
        if type == .ended {
            guard let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt else { fatalError() }
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            if options.contains(.shouldResume) {
                // Interruption Ended - playback should resume
            } else {
                // Interruption Ended - playback should NOT resume
            }
        }
    }
}


