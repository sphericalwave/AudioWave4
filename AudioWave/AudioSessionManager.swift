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


class AudioSessionManager: NSObject {
    
    static let sharedInstance = AudioSessionManager()
    
    override init() {
        super.init()
        enableAudio()
        NotificationCenter.default.addObserver(forName: .AVAudioSessionInterruption, object: AVAudioSession.sharedInstance(), queue: .main, using: handleInterruption)
    }
    
    func handleInterruption(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSessionInterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            // Interruption began, take appropriate actions
            print("Interuption Began")
            
        }
        else if type == .ended {
            if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSessionInterruptionOptions(rawValue: optionsValue)
                if options.contains(.shouldResume) {
                    // Interruption Ended - playback should resume
                    let playNotification = Notification(name: .resumePlayers)
                    NotificationCenter.default.post(playNotification)
                } else {
                    // Interruption Ended - playback should NOT resume
                    print("Audio Should Not Resume")
                }
            }
        }
    }
    
    func enableAudio() {
        do {
            let aSession = AVAudioSession.sharedInstance()
            try aSession.setMode(AVAudioSessionModeDefault)
            try aSession.setCategory(AVAudioSessionCategoryPlayback)
            try aSession.setActive(true)
        }
        catch { print(error) }
    }
}
