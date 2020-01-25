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

//NotificationCenter.default.addObserver(forName: .AVAudioSessionInterruption, object: self, queue: .main, using: handleInterruption)


class SWAudioSession: NSObject {
    
    static let sharedInstance = SWAudioSession()
    
    override init() {
        super.init()
        enableAudio()
        NotificationCenter.default.addObserver(forName: AVAudioSession.interruptionNotification, object: AVAudioSession.sharedInstance(), queue: .main, using: handleInterruption)
    }
    
    func handleInterruption(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            // Interruption began, take appropriate actions
            print("Interuption Began")
            
        }
        else if type == .ended {
            if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
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
            try aSession.setMode(AVAudioSession.Mode.default)
            try aSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)))
            try aSession.setActive(true)
        }
        catch { print(error) }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
